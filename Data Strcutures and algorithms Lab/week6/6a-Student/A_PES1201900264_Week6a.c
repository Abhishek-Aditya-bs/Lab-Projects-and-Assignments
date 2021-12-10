#include "6a.h"

static Node* create_Node(int data, Node* link) {
	Node* temp =  (Node*)malloc(sizeof(Node));
	temp -> data = data; 
	temp -> link = link;
	return temp;
}

void List_initialize(List* ptr_List) 
{
//TODO
ptr_List->head=NULL;
ptr_List->number_of_Nodes=0;	
}

void List_insert_front(List* ptr_List, int data) 
{
//TODO	
Node *q=ptr_List->head;
Node*temp=create_Node(data,q);
ptr_List->head=temp;
ptr_List->number_of_Nodes++;
}

const int Node_get_data(Node *Node_ptr) 
{
	//TODO
	return(Node_ptr->data);
}

void List_delete_front(List* ptr_List)
{
	//TODO
	Node*q=ptr_List->head;
	ptr_List->head=ptr_List->head->link;
	free(q);
	ptr_List->number_of_Nodes--;
}

void List_destroy(List* ptr_List) 
{
	//TODO
	Node *q,*temp=NULL;
	q=ptr_List->head;
	while(q!=NULL)
	{
    temp=q;
    q=q->link;
    free(temp);
	}
	free(ptr_List);
}


void stack_initialize(Stack *ptr_stack) 
{
	// TODO
	ptr_stack->ptr_List=(List*)malloc(sizeof(List));
	List_initialize(ptr_stack->ptr_List);
}

void stack_push(Stack *ptr_stack, int key)
{
	// TODO
	List_insert_front(ptr_stack->ptr_List,key);
}

void stack_pop(Stack *ptr_stack) 
{
	// TODO
	List_delete_front(ptr_stack->ptr_List);
}

int stack_is_empty(Stack *ptr_stack) 
{
	// TODO
	if(ptr_stack->ptr_List->number_of_Nodes!=0)
	{
		return 0;
	}
	else
	{
		return 1;
	}
}

const int stack_peek(Stack *ptr_stack)
{
	// TODO
	return Node_get_data(ptr_stack->ptr_List->head);
}

void stack_destroy(Stack *ptr_stack) 
{
	// TODO
	List_destroy(ptr_stack->ptr_List);
	free(ptr_stack);
}


int postfix_eval(const char* expression) 
{
    // TODO
	//Create a stack
	Stack * stk = (Stack *)malloc(sizeof(Stack));
	stack_initialize(stk);//initializing the stack with default values
	int pos = 0;
	//parsing through the string
	while(expression[pos]!='\0')
	{
		if (expression[pos]>='0' && expression[pos] <='9')//checking if the character is operand
			stack_push(stk,(int)expression[pos]-(int)'0');//pushing operand after converting it into int
		else{//evaluation when character is operator and pushing the result to the stack
			int val2 = stack_peek(stk);
			stack_pop(stk);
			int val1 = stack_peek(stk);
			stack_pop(stk);
			if(expression[pos]== '+')
			{
				stack_push(stk,val1+val2);
			}
			if(expression[pos]== '-')
			{
				stack_push(stk,val1-val2);
			}
			if(expression[pos]== '*')
			{
				stack_push(stk,val1*val2);
			}
			if(expression[pos]== '/')
			{
				stack_push(stk,(int)val1/val2);
			}
			if(expression[pos]== '^')
			{
				stack_push(stk,val1^val2);
			}
		}
		pos++;
	}
	return stack_peek(stk);//returning the result of the evaluation
}
			
			
								
				
			
								
			
		
	

