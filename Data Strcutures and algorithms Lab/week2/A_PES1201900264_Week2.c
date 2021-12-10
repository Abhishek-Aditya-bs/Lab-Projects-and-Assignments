#include<stdio.h>
#include<stdlib.h>
#include "sll.h"

void insert_at_end(List *list, int data) {

	Node *temp,*q;
	
	temp=(Node *)malloc(sizeof(Node)); //dynamic memory allocation of the node
	temp->data=data;
	temp->link=NULL;
	
	if(list->head==NULL)//is the list empty
	   list->head=temp;
	   else
	   {
		q=list->head;
		while(q->link!=NULL)//move forward until you reach the last node
		  q=q->link;
		q->link=temp; //link the new node to last node     
	    }
		list->number_of_nodes++;
	}



void list_delete_front(List* list) {
	
	 Node  *q;
	if(list->head!=NULL){
	 q=list->head; 
	 list->head=q->link;  // make head point to next node
	 free(q);
	 list->number_of_nodes--;}
	else{printf("List is empty\n");}
		 
}

void list_insert_at (List *list, int data, int position)
{
	Node  *prev,*temp,*q;
	
	int i=0;
	prev=NULL;//initailize prev to NULL
	
	q=list->head;
	
	//create a node
	
	temp=(Node *)malloc(sizeof(Node));
	temp->data=data;
	temp->link=NULL;
	
	
	//move forward until the position is found
	while((q!=NULL)&&(i<position))
	{
		prev=q;
		q=q->link;
		i++;
	}
	if(q!=NULL) // position found
	{
	   if(prev==NULL) // first position
	    {
		temp->link=list->head;
		list->head=temp;
		list->number_of_nodes++;
	    }
	    else
	    {
		prev->link=temp; //somewhere between 1 and last but one position
		temp->link=q;
		list->number_of_nodes++;
	    }
	}
       else //q==NULL
        {
	   if(i==position) //insert at end, last position
	     {prev->link=temp;list->number_of_nodes++;}
	   else
	     printf("Invalid Position");
        }
      		   
	
}

void list_reverse(List* list)
{

	
	Node *prev, *temp, *curr;
	prev=NULL;
	
	curr=list->head;
	
	while(curr!=NULL)
	{
		temp=curr->link;
		curr->link=prev;
		prev=curr;
		curr=temp;
	}
	
	 list->head=prev;
	
}


