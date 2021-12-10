#include "heap.h"
heap* heap_construct(int n){
    heap* tmp=(heap*)malloc(sizeof(heap)+n*sizeof(int));
    tmp->capacity=n;
    tmp->size=0;
    return(tmp);
}
void heap_destruct(heap* tmp)
{
    //TODO
    free(tmp);
}
int heap_get_capacity(heap* tmp)
{
    //TODO
    return tmp->capacity;
}
int heap_get_size(heap* tmp)
{
    //TODO
    return tmp->size;
}

int heap_insert(heap* tmp,int data)
{
    //TODO
    tmp->elements[0] = 0;
    if (tmp->size < tmp->capacity) 
    {   
        tmp->size = tmp->size +1;
        tmp->elements[tmp->size] = data;
    }
	else 
        return 0;
	int child = tmp->size;
	while (child && data < tmp->elements[child/2]) 
    {
		tmp->elements[child] = tmp->elements[child/2];
		tmp->elements[child/2] = data;
		child /= 2;
	}
	return 1;
}
int heap_get_min(heap* tmp){
    //TODO
    return tmp->elements[1];
}
void heap_remove(heap* tmp)
{
    //TODO
    tmp->elements[0] = 0;
    tmp->elements[1] = tmp->elements[tmp->size];
    tmp->size = tmp->size -1;
	int temporary_element;
    int minimum_element;
    int current_element = 1;
	while (2*current_element <= tmp->size) 
    {
		minimum_element = 2*current_element;
		if(minimum_element < tmp->size) 
		{
            if(tmp->elements[2*current_element] < tmp->elements[2*current_element+1])
            {
                minimum_element = 2*current_element;
            }
            else 
                minimum_element = 2*current_element+1;
		}

		if (tmp->elements[current_element] > tmp->elements[2*current_element] || tmp->elements[current_element] > tmp->elements[2*current_element+1])
        {
			temporary_element = tmp->elements[minimum_element];
			tmp->elements[minimum_element] = tmp->elements[current_element];
			tmp->elements[current_element] = temporary_element;
			current_element = minimum_element;
		}
		else 
            break;
    }
}

