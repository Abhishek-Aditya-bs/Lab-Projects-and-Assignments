#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sym_tab.h"
extern table* t;

table* allocate_space_for_table()	
{
	/*
        allocate space for table pointer structure eg (t_name)* t
        initialise head variable eg t->head
        return structure
    	*/
    table* temp = (table*)malloc(sizeof(table));
    temp->head = NULL;
    return temp;
}

symbol* allocate_space_for_table_entry(char* name, int size, int type, int lineno, int scope) //allocates space for items in the list
{
	/*
        allocate space for entry pointer structure eg (s_name)* s
        initialise all struct variables(name, value, type, scope, length, line number)
        return structure
    	*/
    symbol *s = (symbol*)malloc(sizeof(symbol));
    s->name = name;
    char* value;
    switch (type)
    {
    case 1:
        value = malloc(sizeof(char)*3);
        value = "''c";
        break;
    case 2:
        value = malloc(sizeof(char)*2);
        *value ="0i";
        break;
    case 3:
        value = malloc(sizeof(char)*4);
        value ="0.0f";
        break;
    case 4:
        value = malloc(sizeof(char)*5);
        value ="0.00d";
        break;
    default:
        break;
    }
    s->val = value;
    s->size = size;
    s->type = type;
    s->line = lineno;
    s->scope = scope;
    s->next = NULL;
    return s;
}

int insert_into_table(symbol* s)/* 
 arguments can be the structure s_name already allocated before this function call
 or the variables to be sent to allocate_space_for_table_entry for initialisation        
*/
{
    /*
        check if table is empty or not using the struct table pointer
        else traverse to the end of the table and insert the entry
    */
   if(s==NULL){
       return 0;
   }
    
   else{
       if(t->head == NULL){
           t->head = s;
           return 1;
       }
       else{
           symbol* temp = t->head;
           while(temp->next!=NULL){
               temp = temp->next;
           }
           temp->next = s;
           return 1;
       }
   }

}

int check_symbol_table(char* name) //return a value like integer for checking
{
    /*
        check if table is empty and return a value like 0
        else traverse the table
        if entry is found return a value like 1
        if not return a value like 0
    */
   if(t->head == NULL){
       return 0;
   }
   else{
       symbol* temp = t->head;
       while(temp!=NULL){
           if(strcmp(temp->name,name)==0){
               return 1;
           }
            else{
               temp = temp->next;
           }
       }
        if(temp==NULL){
            return 0;
        } 
   }
}

int checkDefaultValue(char *name){
    symbol* temp = t->head;
       while(temp!=NULL){
           if(strcmp(temp->name,name)==0){
               switch(temp->type){
                   case 1: if(strcmp(temp->val,"''c") == 0){
                       return 1;
                   }
                   case 2: if(strcmp(temp->val,"0i") == 0){
                       return 1;
                   }
                   case 3: if(strcmp(temp->val,"0.0f") == 0){
                       return 1;
                   }
                   case 4: if(strcmp(temp->val,"0.00d") == 0){
                       return 1;
                   }
               }
            return 0;
        }
            else{
               temp = temp->next;
           }
    }
}  


symbol* getSymbolTableEntry(char *name){
        symbol* temp = t->head;
        while(temp!=NULL){
            if(strcmp(temp->name,name)==0){
                return temp;
            }
            else{
                temp = temp->next;
            }
        }
}

int insert_value_to_name(char* name,char* value, int type)
{
    /*
        if value is default value return back
        check if table is empty
        else traverse the table and find the name
        insert value into the entry structure
    */
   if(t->head == NULL){
       return 0;
   }
   else{
       symbol* temp = t->head;
       while(temp!=NULL){
           if(strcmp(temp->name,name)!=0){
               temp = temp->next;
           }
       }
        if(temp==NULL){
            return 0;
        } 
        else{
            temp->val = value;
            return 1;
        }
}
}

void display_symbol_table()
{
    /*
        traverse through table and print every entry
        with its struct variables
    */
   if(t->head==NULL){
       printf("Table Empty\n");
       printf("Name\tSize\tType\tlineno\tscope\tvalue\n");
    }
    else{
        printf("Name    	Size	Type	Lineno	scope	value\n");
        symbol* temp = t->head;
        while(temp!=NULL){
            printf("%7s\t%3d\t%4d\t%6d\t%5d\t%5s\n", temp->name, temp->size, temp->type, temp->line, temp->scope, temp->val);
            temp = temp->next;
        }
    }
}

