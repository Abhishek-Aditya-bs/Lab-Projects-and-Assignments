#include"dll.h"
int count_nodes(List* dll)
{
	return dll->number_of_nodes; //returns the number of nodes in the list 
	
}

void insert_front(List* dll, int data)
{
    Node *temp, *q;
	
	//create a node
	
	temp=(Node*)malloc(sizeof(Node));
	temp->data=data;
	temp->next=temp->prev=NULL;
	
	if(dll->head==NULL)//check if it is the first node
	  {
		  dll->head=temp;// copy address of new node into head
		  dll->number_of_nodes++; 
	  }
	else
	{
        temp->next=dll->head;  //link the new node to the first node
		(dll->head)->prev=temp;
		dll->head=temp; //copy temp into head
		dll->number_of_nodes++;

	}	
}


void dllist_delete_beginning(List* list)
{
    Node *q;
		
		q=list->head;
		if(q==NULL)
		{return;}
		
		//if it is the only node in the list
		else if(q->next==NULL)
		  {
			  list->head=NULL;
			  list->number_of_nodes--;
		  }
	    else  //list contains more than one node
		{
		   list->head=q->next; // make head to point to next node
		   (list->head)->prev=NULL; //copy NULL into prev field
		   list->number_of_nodes--;
		}
	  free(q);
}


void position_delete(List* dll, int pos)
{
    Node *q;
	
	q=dll->head; // copy head into q;
	
	int i=0;
	
	//move forward until the position is found
	while((q!=NULL )&& (i<pos) )
	{
		q=q->next;
		i++;
	}
	if(q!=NULL)//position found
	{
	   if((q->prev==NULL)&&(q->next==NULL))//only one node
		{dll->head=NULL;dll->number_of_nodes--;}
	   else if(q->prev==NULL )//first position
	   {
		dll->head=q->next;
		(dll->head)->prev=NULL;
		dll->number_of_nodes--;
	   }
	   else if (q->next==NULL) //last position
		{q->prev->next=NULL;dll->number_of_nodes--;}
	   else //somewhere in the middle position
           {
		q->prev->next =q->next;
		q->next->prev=q->prev;
		dll->number_of_nodes--;
	   }	
  	free(q);
	}
	else //q==NULL, position not found
	   return;
}

int search_list(List* dll,int key)
{
    if(dll->head==NULL)
        return -1;
    else
    {	
	 Node *find=dll->head;
    int x=0;
    while(x<dll->number_of_nodes)
    {
        if(find->data==key)
        {
            return x; //returning the found element (key) node position
            break; //once found break out of the loop
        }
        x++;
        find=find->next;
    }
    return -1; //return -1 when the key element to be found in the list is not found
       
    }
	 
    
}


void reverse_list(List* dll)
{
    if(dll->head ==NULL)
	printf("List is empty");
	else
	{
	Node *curr=dll->head;
    dll->tail=dll->head; //interchanging head and tail pointers
    Node *temp=NULL;
    while(curr!=NULL)
    {   //reversing the list
        temp=curr->prev;
        curr->prev=curr->next;
        curr->next=temp;
        curr=curr->prev;
    }
    dll->head=temp->prev;

	}
	
}


