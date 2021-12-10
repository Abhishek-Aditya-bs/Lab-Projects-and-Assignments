#include "6b.h"
stack* stack_initialize(int size)
{
//TODO
  stack * stk = (stack *)malloc(sizeof(stack));
  stk->arr = (int *)malloc(sizeof(int)*size);
  stk->top = -1;
  return stk;
}

void stack_push(stack *ptr_stack, int key) 
{
//TODO
 ptr_stack->top=ptr_stack->top+1;
 ptr_stack->arr[ptr_stack->top] = key;
}

void stack_pop(stack *ptr_stack)
{
//TODO
  ptr_stack->top=ptr_stack->top-1;
}

int stack_is_empty(stack *ptr_stack)
{
//TODO
    if(ptr_stack->top == -1)
    {
        return 1;
    }
    else{
        return 0;
    }
}

int stack_peek(stack *ptr_stack) 
{
//TODO
    return ptr_stack->arr[ptr_stack->top];
}

void stack_destroy(stack *ptr_stack) 
{
//TODO
    free(ptr_stack->arr);
    free(ptr_stack);
}

void convert_infix_to_postfix(const char *source_infix,char *target_postfix)
{
//TODO
//initialize satck to default values
stack * stk = stack_initialize((int)strlen(source_infix));
  int target_pos = 0;
  int i=0;
  while(source_infix[i]!='\0'){//parse through the string
    //check for variables
    if((source_infix[i]>='A' && source_infix[i]<='Z') || (source_infix[i]>='a' && source_infix[i]<='z'))
      target_postfix[target_pos++] = source_infix[i];
    //check for opening parenthesis
    else if(source_infix[i]=='(' || source_infix[i]=='{' || source_infix[i]=='[')
      stack_push(stk,source_infix[i]);
    else if(source_infix[i]==')' || source_infix[i]=='}' || source_infix[i]==']'){
      char top_element = (char)stack_peek(stk);
      char Opening_paranthesis = ' ';
      if(source_infix[i]==')')
        Opening_paranthesis = '(';
      else if(source_infix[i]=='}')
        Opening_paranthesis = '{';
      else
        Opening_paranthesis = '[';
      while(!stack_is_empty(stk) && (top_element!=Opening_paranthesis)){//go on popping till the appropriate bracket is found
        target_postfix[target_pos++] = stack_peek(stk);
        stack_pop(stk);
        top_element = (char)stack_peek(stk);
      }
      stack_pop(stk);//pop the opening paranthesis 
    }
    else{//check for precedence of operators in stack and the string
      char top_element = (char)stack_peek(stk);
      int precedence_1=0,precedence_2=0;
      if(source_infix[i] == '*')
      {precedence_2 = 4;}
      if(source_infix[i] == '/')
      {precedence_2 = 3;}
      if(source_infix[i] == '+')
      {precedence_2 = 2;}
      if(source_infix[i] == '-')
      {precedence_2 = 1;}

      if((char)top_element == '*')
      {precedence_1 = 4;}
      if((char)top_element == '/')
      {precedence_1 = 3;}
      if((char)top_element == '+')
      {precedence_1 = 2;}
      if((char)top_element == '-')
      {precedence_1 = 1;}
      
      while(!stack_is_empty(stk) && (top_element!='(' || top_element!='{' || top_element!='[') && precedence_1>precedence_2){
        target_postfix[target_pos++] = stack_peek(stk);
        stack_pop(stk);
        if((char)top_element == '*')
        {precedence_1 = 4;}
        if((char)top_element == '/')
        {precedence_1 = 3;}
        if((char)top_element == '+')
        {precedence_1 = 2;}
        if((char)top_element == '-')
        {precedence_1 = 1;}
      }
      stack_push(stk,source_infix[i]);//add the operator to the stack if it has higher precedence than top of the stack
    }
    i++;
  }
  while(!stack_is_empty(stk)){
    target_postfix[target_pos++] = stack_peek(stk);//store the last elemnet left in the stack
    stack_pop(stk);
  }
}
