#include "cll.h"

void position_insert(List* cll, int data, int pos)
{
    Node *temp =create_node(data);
    Node *curr=cll->head;
    int i=0;
    if(pos<0 || pos>cll->length) //position out of range
    {
        return; //return nothing
    }
    if(pos<=cll->length)
    {
        cll->length+=1;
        if(cll->head==NULL) //no node present ,empty list
        {
            cll->head=temp;
            temp->next=temp;
            cll->tail=temp;
        }
        else if(cll->head!=NULL && pos==0) //inserting at first position in non-empty list 
        {
            temp->next=cll->head;
            cll->tail->next=temp;
            cll->head=temp;
        }
        else
        {                           //inserting at position other than the first position
            for(int i=1;i<pos;i++)
            {
                curr=curr->next;
            }
            temp->next=curr->next;
            curr->next=temp;
            if(pos+1==cll->length)
            {cll->tail=temp;}
        }
    }
}
void position_delete(List* cll, int pos)
{
    Node *temp=cll->head;
    Node *del=cll->head;
    if(pos<0 || pos>=cll->length) //position out of range
    {
        return;
    }
    if(pos<cll->length)
    {   int i=0;
        if (cll->head==cll->tail && pos==0) //only one node present
        {
            del=cll->head;
            cll->head=NULL;
            cll->tail=NULL;
            
        }
        else
        {
            if(pos==0) //delete first position in non-empty list
            {
                del=cll->head;
                cll->head=del->next;
                cll->tail->next=cll->head;
            }
            else if(pos==(cll->length)-1) //delete last position
            {
                while(temp->next!=cll->tail)
                {
                    temp=temp->next;
                }
                del=cll->tail;
                temp->next=cll->head;
                cll->tail=temp;
            }
            else
            { //delete any position between first and last position
                for(int i=1;i<pos;i++)
                {
                    temp=temp->next;
                }
                del=temp->next;
                temp->next=del->next;
            }
        }
        free(del);
        cll->length-=1;
        
    }
}
int josephus(List* cll, int k)
{   
    //assuming k is given in range
    int i=0;
    Node *temp= cll->head; 
    Node *del=NULL;
    while(i<k) 
    {
        temp=temp->next; //traverssing to the position k in the list
        i++;
    }
    while(cll->length!=1) //deleting every k+1,k+3,k+5...... position
    { //deleting until there is one node left
        del=temp->next;
        temp->next=del->next;
        free(del);  //deleting k+1 position
        temp=temp->next;
        cll->length-=1;  
    }
    cll->tail=temp;
    cll->head=temp;
    return temp->data; //returning the data of the last node left in the list
}
