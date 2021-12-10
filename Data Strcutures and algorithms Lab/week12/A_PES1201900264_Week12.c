#include "hash.h"
HashTable *create_table(int size)
{
    HashTable * ht = (HashTable *)malloc(sizeof(HashTable));
    ht->table = (int*)malloc(sizeof(int)*size);
    for(int i=0;i<size;i++)
    {
         ht->table[i]=-1;//initialize all the hashtable elements to -1
    }
    ht->size = size;///initializing the size of the hashtable 
    return ht;
}

void insert(HashTable *htable, int element)
{   if(element >= 0)
    {
    if(search(htable,element))
    {//if the element is already inserted don't insert it twice
        return;
    }
    else
    {//if the element is not present then insert it

    int h1 = element % htable->size;//hash function hf = x%size_of_hash_table

    if(htable->table[h1]==-1)
    {//if slot is empty then insert the element at that slot
        htable->table[h1]=element;
    }

    else
    {//if there is a collision 

        int h2 = (h1 + 1)%htable->size;
        while(h2!=h1 && htable->table[h2]!=-1)
        {
            h2 = (h2+1)%htable->size;// linear probing in case of collision 
        }
        //if the loop terminates it means the hashtable is filled or 
        //we have reached the original slot which is filled
        if(h2==h1) 
            {//dont insert if no empty slot is found
                return;
            }
        else 
            {
                htable->table[h2]=element; //else insert at the empty slot
            }
    }
    }
    }
    else{return;}
}

int search(HashTable *htable, int element)
{   if(element >= 0)
    {
    int h1 = element % htable->size; //hash function hf = x%size_of_hash_table
    int found=0; //flag for search operartion
    if(htable->table[h1]==-1 || htable->table[h1]!=element) //if element is not present at the hash key
    {
        // we need to also perform linear search since we performed linear probing 
        //since the required element can be stored in some other position
        
        int h2 = (h1 + 1)%htable->size; //linear probing
        while(h2!=h1) //search in a circular fashion
        {
            if(htable->table[h2]==element)
            {
                found=1;
                break;
            }
            h2 = (h2+1)%htable->size;
        }
    }
    else //element is found at the computed hash key
        {found=1;}
    return found;
    }
    else{return 0;}
}

void delete (HashTable *htable, int element)
{
    if(search(htable,element))
    {
    int h1 = element % htable->size; //hash function hf = x%size_of_hash_table

    if(htable->table[h1]==-1 || htable->table[h1]!=element) //if element is not present at the hash key
    {
        // we need to also perform linear search since we performed linear probing 
        //since the required element can be stored in some other position
        //and then we shud perform delete operation

        int h2 = (h1 + 1)%htable->size; //linear probing
        while(h2!=h1)//searching in a circular fashion
        {
            if(htable->table[h2]==element)
            {
                htable->table[h2]=-1;
                break;
            }
            h2 = (h2+1)%htable->size;
        }
    }
    else //element is found at the computed hash key
        {htable->table[h1]=-1;}
    }
    else{return;}
    
}

void destroy_table(HashTable *htable)
{
    free(htable->table);//freeing the memory allocated for the hash table
    free(htable);
    htable=NULL;//making the hashtable pointer NULL to avoid dangling pointer issue
}