#include "poly.h"
void insert_at_end(List *list, int data) 
{
    Node *new_node = (Node *)malloc(sizeof(Node));
    new_node->data = data;
    new_node->link = NULL;
    if (list->number_of_nodes == 0) //list is empty
    {
        list->head = new_node;
        list->number_of_nodes++;
        return;
    }
    Node *n = list->head;
    while (n->link != NULL)
    {
        n = n->link;
    }
    n->link = new_node; //inserting node at the end of the list
    list->number_of_nodes++;
}

long long int evaluate(List *list, int x)
{
    int i=0,x_power=1;
    long long int sum=0;
    Node *temp= list->head;
    for(i=0;i<list->number_of_nodes;i++)
    {
        sum=sum+(temp->data)*x_power; //adding each term of the polynomial multiplied by x powers
		x_power*=x;
		temp=temp->link;
    }

   return sum;

}
