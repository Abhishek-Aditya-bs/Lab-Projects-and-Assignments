#include "hash.h"
HashTable *create_table(int size){
    HashTable * new = (HashTable *)malloc(sizeof(HashTable));
    new->table = (int*)malloc(sizeof(int)*size);
    //initialize all elements to -1 to indicate they have no brains :)
    for(int i=0;i<size;i++) new->table[i]=-1;
    new->size = size;
    return new;
}

void insert(HashTable *htable, int element){
    //Compute Hash Function first!
    int hashKey = element % htable->size;
    if(htable->table[hashKey]==-1){
        htable->table[hashKey]=element;
    }
    else{
        //perform linear probing
        int newKey = (hashKey + 1)%htable->size;
        while(newKey!=hashKey && htable->table[newKey]!=-1){
            newKey = (newKey+1)%htable->size;
        }
        //when loop terminates we will either be at the position of insertion or we would have
        //traversed the entire hash table.
        if(newKey==hashKey) return;
        else 
            htable->table[newKey]=element;
    }
}

int search(HashTable *htable, int element){
    //Compute Hash Function first!
    int hashKey = element % htable->size;
    int flag=0;
    if(htable->table[hashKey]==-1 || htable->table[hashKey]!=element){
        //if hashKey of HashTable is empty or is not equal to element we
        //need to perform a linear search to check if the element is 
        //stored in any other position casued due to collision
        int newKey = (hashKey + 1)%htable->size;
        while(newKey!=hashKey){
            if(htable->table[newKey]==element){
                flag=1;
                break;
            }
            newKey = (newKey+1)%htable->size;
        }
    }
    else 
        flag=1;
    return flag;
}

void delete (HashTable *htable, int element){
    //Compute Hash Function first!
    int hashKey = element % htable->size;
    if(htable->table[hashKey]==-1 || htable->table[hashKey]!=element){
        //Linear probing to search for element to delete
        int newKey = (hashKey + 1)%htable->size;
        while(newKey!=hashKey){
            if(htable->table[newKey]==element){
                htable->table[newKey]=-1;
                break;
            }
            newKey = (newKey+1)%htable->size;
        }
    }
    else
        htable->table[hashKey]=-1;
    return;
}

void destroy_table(HashTable *htable){
    free(htable->table);
    free(htable);
    htable=NULL;
}