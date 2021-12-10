#include "queue.h"
static node *create_node(int id, int time, node *link)
{
//TODO
	node *temp=(node *)malloc(sizeof(node));
	temp->id=id;
	temp->time=time;
	temp->link=link;
	return temp;
}
void list_initialize(List *ptr_list)
{
//TODO
	ptr_list->head=NULL;
	ptr_list->tail=NULL;
	ptr_list->number_of_nodes=0;
}
const int node_get_id(node *node_ptr)
{
//TODO
	return node_ptr->id;	
}

const int node_get_time(node *node_ptr)
{
//TODO
	return node_ptr->time;	
}

void list_insert_rear(List *ptr_list, int id, int time)
{
//TODO	
	node *temp=create_node(id,time,NULL);
	if(ptr_list->number_of_nodes==0){
		ptr_list->head = ptr_list->tail = temp;
		ptr_list->number_of_nodes++;
	}
	else {
		ptr_list->tail->link=temp;
		ptr_list->tail=temp;
		ptr_list->number_of_nodes++;
	}

}

void list_delete_front(List *ptr_list)
{
//TODO
	if(ptr_list->number_of_nodes == 0){
		return;
	}
	else if(ptr_list->number_of_nodes == 1){
		node *temp = ptr_list->head;
		ptr_list->head=NULL;
		ptr_list->tail=NULL;
		free(temp);
		ptr_list->number_of_nodes--;	
	}
	else{	
	node *temp =ptr_list->head;
	ptr_list->head=ptr_list->head->link;
	free(temp);
	ptr_list->number_of_nodes--;
	}
}

void list_destroy(List *ptr_list)
{
//TODO	
	if(ptr_list->number_of_nodes == 0){
		return;
	}
	node *q=NULL;
	node *temp=ptr_list->head;
	while(temp!=NULL){
		q=temp;
		temp=temp->link;
		free(q);
	}	
	free(ptr_list);

}

void queue_initialize(Queue *queue_list)
{
//TODO
	queue_list->ptr_list=(List *)malloc(sizeof(List));
	list_initialize(queue_list->ptr_list);	
}

void queue_enqueue(Queue *ptr, int id, int time)
{
//TODO	
	list_insert_rear(ptr->ptr_list,id,time);

}

void queue_dequeue(Queue *ptr)
{
//TODO	
	list_delete_front(ptr->ptr_list);	
}

int queue_is_empty(Queue *ptr)
{
//TODO	
	if(ptr->ptr_list->number_of_nodes == 0 && ptr->ptr_list->head == NULL && ptr->ptr_list->tail == NULL){
		return 1;
	}
	else{
		return 0;
	}	
}

void queue_peek(Queue *ptr)
{
//TODO
	if(queue_is_empty(ptr)){
		printf("Empty Queue\n");
	}
	else{		
	printf("%d %d\n",ptr->ptr_list->head->id,ptr->ptr_list->head->time);
	}
}

void queue_destroy(Queue *ptr)
{
//TODO	
	list_destroy(ptr->ptr_list);	
}

const int queue_find_person(Queue *ptr_queue, int t)
{
//TODO
		if(queue_is_empty(ptr_queue)){
			printf("Empty Queue\n");
		}
		else{
			int sum_t=0;
			node *temp=ptr_queue->ptr_list->head;
			if(temp->time > t){
				printf("\n%d\n",ptr_queue->ptr_list->head->id);
			}
			else{
			while(sum_t<= t){
				sum_t=sum_t+(temp->time);
				if(temp!=NULL && temp->link!= NULL && ((sum_t + temp->link->time)<=t)){
				temp=temp->link;
				if(!(queue_is_empty(ptr_queue))){
				queue_dequeue(ptr_queue);
				}
				else{
					printf("Empty Queue\n");
				}
				}
				else{
					temp=temp->link;
					queue_dequeue(ptr_queue);
					if(temp == NULL){
						printf("Empty Queue\n");
						break;
					}
					else{
					break;
					}
				}

			}
			if(temp!=NULL){
			ptr_queue->ptr_list->head=temp;
			printf("%d\n",ptr_queue->ptr_list->head->id);}
		} }return 0;
}
/*void list_destroy(List *ptr_list)
{
//TODO
	if(ptr_list->head ==NULL || ptr_list->number_of_nodes == 0){
		return;
	}
	node *q=NULL;
	node *temp=ptr_list->head;
	while(temp!=NULL){
		q=temp;
		temp=temp->link;
		free(q);
	}	
	free(ptr_list);

}*/
