#include "5a.h"

static Node* create_Node(int data, Node* link)
 {
// TODO - create and allocate dynamic space
Node*temp = (Node*)malloc(sizeof(Node));
temp->data=data;
temp->link=link;
return temp;
}


void list_initialize(List* ptr_list) 
{
//TODO - initialize structure members to default values
ptr_list->head=NULL;
ptr_list->number_of_Nodes=0;
}


void list_insert_front(List* ptr_list, int data) 
{
//TODO - perform linked list implementation of push operation.
Node *q=ptr_list->head;
Node*temp=create_Node(data,q);
ptr_list->head=temp;
ptr_list->number_of_Nodes++;
}


const int Node_get_data(Node *Node_ptr) 
{
//TODO - return the top most element
return(Node_ptr->data);
}


void list_delete_front(List* ptr_list) 
{
//TODO - perform linked list implementation of pop operation.
Node*q=ptr_list->head;
ptr_list->head=ptr_list->head->link;
free(q);
ptr_list->number_of_Nodes--;
}


void list_destroy(List* ptr_list) 
{
//TODO - free the allocated space
Node *q,*temp=NULL;
q=ptr_list->head;
while(q!=NULL)
{
    temp=q;
    q=q->link;
    free(temp);
}
free(ptr_list);
}

void Stack_initialize(Stack *ptr_Stack) 
{
//TODO - get the memory allocation for stack, and intern call list initialize
ptr_Stack->ptr_list=(List*)malloc(sizeof(List));
list_initialize(ptr_Stack->ptr_list);
}

void Stack_push(Stack *ptr_Stack, int key) 
{
//TODO	 - call the function list_insert_front
list_insert_front(ptr_Stack->ptr_list,key);
}

void Stack_pop(Stack *ptr_Stack) 
{
//TODO- call the function list_delete_front
list_delete_front(ptr_Stack->ptr_list);
}

int Stack_is_empty(Stack *ptr_Stack) 
{
//TODO	- return 0 if stack is not empty
if(ptr_Stack->ptr_list->number_of_Nodes!=0)
{return 0;}
else{return 1;}
}

const int Stack_peek(Stack *ptr_Stack) 
{
//TODO	- return the top most element of the stack
return(ptr_Stack->ptr_list->head->data);
}

void Stack_destroy(Stack *ptr_Stack)
 {
//TODO	- deallocate
list_destroy(ptr_Stack->ptr_list);
free(ptr_Stack);
}

int match_parenthesis(const char* string)
{
//TODO - implement the code to match paranthesis in a string which is passed as a parameter.
Stack * stack = (Stack *)malloc(sizeof(Stack));
  Stack_initialize(stack);
  int index = 0;
  int flag;
  int top;
  while(string[index]!='\0'){
    if(string[index]==')' || string[index]==']' ||string[index]=='}'){
      if(Stack_is_empty(stack))
        return 0;
      top = Stack_peek(stack);
      Stack_pop(stack);
      if((top=='(' && string[index]==')') || (top=='[' && string[index]==']') || (top=='{' && string[index]=='}'))
      {
        flag=0;
      }
      else
      {
        flag=1;
      }
      
      if(flag)
        return 0;
    }
    else
      Stack_push(stack,string[index]);
    index++;
  }
  if(Stack_is_empty(stack))
  {return 1;}
  else
  {return 0;}
  
}

	


 

