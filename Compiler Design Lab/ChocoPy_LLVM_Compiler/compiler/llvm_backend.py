################ Team Details ####################
# Abhishek Aditya BS    - PES1UG19CS019  CGPA: 9.1
# Abhiram Puranik       - PES1UG19CS018  CGPA: 8.9
# Adithya MS            - PES1UG19CS027  CGPA: 9.6
# VI Semester 'A' Section


from pprint import pprint
from typing import Dict, List, Optional

from llvmlite import binding, ir
from llvmlite.ir.instructions import CallInstr, ICMPInstr, LoadInstr, PhiInstr

from .astnodes import (
    AssignStmt,
    BinaryExpr,
    BooleanLiteral,
    CallExpr,
    ClassType,
    ExprStmt,
    FuncDef,
    Identifier,
    IfExpr,
    IfStmt,
    IntegerLiteral,
    Node,
    NoneLiteral,
    Program,
    ReturnStmt,
    StringLiteral,
    TypedVar,
    UnaryExpr,
    VarDef,
    WhileStmt,
)
from .backend import Backend


class LLVMBackendError(Exception):
    def __init__(self, message, node: Node = None):
        if node is not None:
            if hasattr(node, "lineno"):
                super().__init__(
                    message
                    + ". Line {:d} Col {:d}".format(node.lineno, node.col_offset)
                )
                return
        super().__init__(message + ".")


class LLVMBackend(Backend):
    def __init__(self, int_bits=32, bool_bits=1, char_bits=8):
        # Create module to hold IR code
        self.module = ir.Module()
        self.module.triple = binding.get_process_triple()

        # Set parameters
        self.int_bits = int_bits
        self.bool_bits = bool_bits
        self.char_bits = char_bits

        # Create main func to hold toplevel declarations and statements
        self.main_func = ir.Function(
            self.module, ir.FunctionType(ir.IntType(self.int_bits), []), "main"
        )
        self.builder: Optional[ir.IRBuilder] = ir.IRBuilder(
            self.main_func.append_basic_block("entry")
        )

        # Declare global functions
        voidptr_ty = ir.PointerType(ir.IntType(self.char_bits))
        printf_ty = ir.FunctionType(
            ir.IntType(self.int_bits), [voidptr_ty], var_arg=True
        )
        ir.Function(self.module, printf_ty, "printf")

        # Create symbol table to store variables in scope
        self.func_symtab: List[Dict[str, ir.Value]] = [{}]

    def visit(self, node: Node):
        return node.visit(self)

    # Performs memory allocation for a new variable
    def _create_alloca(self, name, typ):
        if self.builder is None:
            raise Exception("No builder is active")

        with self.builder.goto_entry_block():
            alloca = self.builder.alloca(typ, size=None, name=name)
        return alloca

    # Returns the address of a variable from the symbol table
    def _get_var_addr(self, name):
        try:
            return self.func_symtab[-1][name]
        except KeyError:
            raise Exception("Undefined variable: " + name)

    # Returns the LLVM type object corresponding to the type name
    def _get_llvm_type(self, typename: str):
        if typename == "int":
            return ir.IntType(self.int_bits)
        elif typename == "str":
            return ir.PointerType(ir.IntType(self.char_bits))
        elif typename == "bool":
            return ir.IntType(self.bool_bits)
        elif typename == "<None>":
            return ir.VoidType()
        else:
            raise Exception(f"Invalid type: {typename}")

    ##################################
    #        TO BE IMPLEMENTED       #
    ##################################

    def VarDef(self, node: VarDef):
        if self.builder is None:
            raise Exception("No builder is active")

        # Allocate memory for variable
        alloca = self._create_alloca(node.var.identifier.name, self._get_llvm_type(node.var.type.className))

        # Store value in variable
        value = self.visit(node.value)
        self.builder.store(value, alloca)

        # Add variable to symbol table
        self.func_symtab[-1][node.var.identifier.name] = alloca

    def AssignStmt(self, node: AssignStmt):
        if self.builder is None:
            raise Exception("No builder is active")

        # Get address of variable
        # # print("From AssignStmt:", node.targets[0].name)
        # var_addr = self._get_var_addr(node.targets[0].name)

        # # Store value in variable
        # value = self.visit(node.value)
        # self.builder.store(value, var_addr)

        # Loop through targets and store value in each
        for target in node.targets:
            var_addr = self._get_var_addr(target.name)
            value = self.visit(node.value)
            self.builder.store(value, var_addr)

    def IfStmt(self, node: IfStmt):
        if self.builder is None:
            raise Exception("No builder is active")
        
        # Defining 3 basic blocks of if
        bb_condition = self.builder.append_basic_block(
            self.module.get_unique_name("if.condition")
        )
        bb_then = self.builder.append_basic_block(self.module.get_unique_name("if.then"))
        bb_else = self.builder.append_basic_block(self.module.get_unique_name("if.else"))
        bb_end = self.builder.append_basic_block(self.module.get_unique_name("if.end"))

        # Jump to condition block
        self.builder.branch(bb_condition)

        # Condition block
        with self.builder.goto_block(bb_condition):
            condition = self.visit(node.condition)
            self.builder.cbranch(condition, bb_then, bb_else)

        # Then block
        with self.builder.goto_block(bb_then):
            for stmt in node.thenBody:
                self.visit(stmt)
            self.builder.branch(bb_end)

        # Else block
        with self.builder.goto_block(bb_else):
            for stmt in node.elseBody:
                self.visit(stmt)
            self.builder.branch(bb_end)

        # End block
        self.builder.position_at_end(bb_end)

    def WhileStmt(self, node: WhileStmt):
        # Data members of while AST nodes can be found at ./astnodes/whilestmt.py
        
        if self.builder is None:
            raise Exception("No builder is active")
        
        # Defining 3 basic blocks of while
        bb_condition = self.builder.append_basic_block(
            self.module.get_unique_name("while.condition")
        )
        bb_body = self.builder.append_basic_block(
            self.module.get_unique_name("while.body")
        )
        bb_end = self.builder.append_basic_block(
            self.module.get_unique_name("while.end")
        )

        # Defining control flow because it doesn't explicitly go sequentially
        self.builder.branch(bb_condition)#unconditional branch

        #defining body of basic block bb_condition 
        with self.builder.goto_block(bb_condition):
            condition = self.visit(node.condition)# executes function corresponding to AST node node.condition
            self.builder.cbranch(condition, bb_body, bb_end)# conditional branch statement

        with self.builder.goto_block(bb_body):
            for stmt in node.body:
                self.visit(stmt)# nothing is returned when a statement is executed
            self.builder.branch(bb_condition)

        self.builder.position_at_end(bb_end)


    def BinaryExpr(self, node: BinaryExpr) -> Optional[ICMPInstr]:

        if self.builder is None:
            raise Exception("No builder is active")


        left_val = self.visit(node.left)
        right_val = self.visit(node.right)

        # Perform comparison
        if node.operator == "==":
            return self.builder.icmp_signed("==", left_val, right_val)
        elif node.operator == "!=":
            return self.builder.icmp_signed("!=", left_val, right_val)
        elif node.operator == "<":
            return self.builder.icmp_signed("<",  left_val, right_val)
        elif node.operator == "<=":
            return self.builder.icmp_signed("<=", left_val, right_val)
        elif node.operator == ">":
            return self.builder.icmp_signed(">", left_val, right_val)
        elif node.operator == ">=":
            return self.builder.icmp_signed(">=", left_val, right_val)
        elif node.operator == "+":
            return self.builder.add(left_val, right_val)
        elif node.operator == "-":
            return self.builder.sub(left_val, right_val)
        elif node.operator == "*":
            return self.builder.mul(left_val, right_val)
        elif node.operator == "/":
            return self.builder.sdiv(left_val, right_val)
        elif node.operator == "%":
            return self.builder.srem(left_val, right_val)
        elif node.operator == "and":
            return self.builder.and_(left_val, right_val)
        elif node.operator == "or":
            return self.builder.or_(left_val, right_val)
        else:
            raise Exception("Invalid binary operator")

    def Identifier(self, node: Identifier) -> LoadInstr:
        if self.builder is None:
            raise Exception("No builder is active")

        var_addr = self._get_var_addr(node.name)
        return self.builder.load(var_addr)

    def IfExpr(self, node: IfExpr) -> PhiInstr:

        if self.builder is None:
            raise Exception("No builder is active")

        # Create basic blocks
        bb_cond = self.builder.append_basic_block(self.module.get_unique_name("if.cond"))
        bb_then = self.builder.append_basic_block(self.module.get_unique_name("if.then"))
        bb_else = self.builder.append_basic_block(self.module.get_unique_name("if.else"))
        bb_end = self.builder.append_basic_block(self.module.get_unique_name("if.end"))

        # Create branch
        self.builder.branch(bb_cond)

        # Condition block
        with self.builder.goto_block(bb_cond):
            condition = self.visit(node.condition)
            self.builder.cbranch(condition, bb_then, bb_else)

        # Then block
        with self.builder.goto_block(bb_then):
            then_value = self.visit(node.thenExpr)
            self.builder.branch(bb_end)

        # Else block
        with self.builder.goto_block(bb_else):
            else_value = self.visit(node.elseExpr)
            self.builder.branch(bb_end)

        self.builder.position_at_end(bb_end)

        phi_node = self.builder.phi(self._get_llvm_type(node.inferredType.className))

        # End block
        with self.builder.goto_block(bb_end):
            phi_node.add_incoming(then_value, bb_then)
            phi_node.add_incoming(else_value, bb_else)

        return phi_node


    ##################################
    #      END OF IMPLEMENTATION     #
    ##################################

    # TOP LEVEL & DECLARATIONS
    def Program(self, node: Program):
        for d in node.declarations:
            self.visit(d)
        for s in node.statements:
            self.visit(s)

        # Find the exit basic block and terminate it
        for bb in self.main_func.basic_blocks:
            if not bb.is_terminated:
                self.builder = ir.IRBuilder(bb)
                self.builder.position_at_end(bb)
                self.builder.ret(self._get_llvm_type("int")(0))
        return self

    def FuncDef(self, node: FuncDef):
        # Create new symbol table
        self.func_symtab.append({})

        funcname = node.name.name
        returnType = self._get_llvm_type(node.returnType.className)
        paramTypes = [self.visit(i)["type"] for i in node.params]
        functype = ir.FunctionType(returnType, paramTypes)

        if funcname in self.module.globals:  # Definition for already declared function
            func = existing_func = self.module.globals[funcname]
            if not isinstance(existing_func, ir.Function):
                raise LLVMBackendError(f"Name collision: {funcname}", node)
            if not existing_func.is_declaration:
                raise LLVMBackendError(f"Redefinition of {funcname}", node)
            if len(existing_func.function_type.args) != len(functype.args):
                raise LLVMBackendError(
                    f"Declaration and definition of {funcname} have different signatures",
                    node,
                )
        else:  # New function
            func = ir.Function(self.module, functype, funcname)
            for (name, arg) in zip(
                [self.visit(i)["name"] for i in node.params], func.args
            ):
                arg.name = name

        bb_entry = func.append_basic_block("entry")
        old_builder = self.builder
        self.builder = ir.IRBuilder(bb_entry)

        # Add all arguments to the symbol table and create their allocas
        for arg in func.args:
            alloca = self._create_alloca(arg.name, arg.type)
            self.builder.store(arg, alloca)
            self.func_symtab[-1][arg.name] = alloca

        # Generate code for the body and then return the result
        for d in node.declarations:
            self.visit(d)
        for s in node.statements:
            self.visit(s)
        if not bb_entry.is_terminated:
            self.builder.ret_void()

        # End the function scope
        self.func_symtab.pop()
        self.builder = old_builder

    # STATEMENTS
    def ExprStmt(self, node: ExprStmt):
        self.visit(node.expr)

    def ReturnStmt(self, node: ReturnStmt):
        if self.builder is None:
            raise Exception("No builder is active")

        retval = self.visit(node.value)
        self.builder.ret(retval)

    # Expressions
    def UnaryExpr(self, node: UnaryExpr):
        if self.builder is None:
            raise Exception("No builder is active")

        operand = self.visit(node.operand)
        if node.operator == "-":
            return self.builder.neg(operand, "negtmp")
        elif node.operator == "not":
            return self.builder.sub(self._get_llvm_type("bool")(1), operand)
        else:
            raise LLVMBackendError(f"Unsupported unary operator: {node.operator}", node)

    def CallExpr(self, node: CallExpr) -> CallInstr:
        if self.builder is None:
            raise Exception("No builder is active")

        callee_func = self.module.globals.get(node.function.name, None)
        if callee_func is None or not isinstance(callee_func, ir.Function):
            raise LLVMBackendError(
                f"Call to unknown function {node.function.name}", node
            )

        call_args = [self.visit(arg) for arg in node.args]
        return self.builder.call(callee_func, call_args, "calltmp")

    # LITERALS

    def BooleanLiteral(self, node: BooleanLiteral) -> ir.Constant:
        return self._get_llvm_type("bool")(int(node.value))

    def IntegerLiteral(self, node: IntegerLiteral) -> ir.Constant:
        return self._get_llvm_type("int")(node.value)

    def NoneLiteral(self, node: NoneLiteral) -> ir.Constant:
        return ir.Constant(ir.PointerType(node.value), node.value)

    def StringLiteral(self, node: StringLiteral) -> ir.Constant:
        global_lit = ir.ArrayType(ir.IntType(self.char_bits), len(node.value) + 1)(
            bytearray(node.value.encode("utf8")) + bytearray("\0".encode("utf8"))
        )
        global_name = self.module.get_unique_name("str")
        g = ir.GlobalVariable(self.module, global_lit.type, global_name)
        g.global_constant = True
        g.linkage = "internal"
        g.initializer = global_lit
        return g.gep((ir.IntType(32)(0), ir.IntType(32)(0)))

    # TYPES

    def TypedVar(self, node: TypedVar) -> dict:
        return {
            "name": node.identifier.name,
            "type": self._get_llvm_type(node.type.className),
        }

    def ClassType(self, _: ClassType):
        pass
