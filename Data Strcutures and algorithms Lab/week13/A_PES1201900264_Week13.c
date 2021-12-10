#include<stdio.h>
#include "trie.h"
struct trienode *getnode()
  {
    //TODO
    struct trienode * new_node = (struct trienode *)malloc(sizeof(struct trienode));
    for(int i=0;i<26;i++) 
    {
      new_node->child[i] = NULL;//assigning all the 26 positions of the array to null
    }
    new_node->endofword=0;//assigning the endofword to 0
    return new_node;
  }

  void insert(struct trienode *root, char *key)
  {
     //TODO
      struct trienode *p = root;
      while(*key!='\0')
      {
        if(p->child[*key-'a']==NULL)
        p->child[*key-'a'] = getnode();//if the required position in the array is null then insert the node to that position
        p = p->child[*key-'a'];
        key++;
      }
      p->endofword = 1;//assign the last character in the string endofword to 0 since parsing of string is complete
  }
void display(struct trienode *curr)
  {
      //TODO: 
     //Note : DO NOT USE printf() statement, use printfun() and   newline function for printing output 
     struct trienode * q = curr;
     for(int t=0;t<26;t++)
     {
        if(q->child[t]!=NULL)
        {
          word[length++] = t + 'a';
          if(q->child[t]->endofword)
          {
            for(int k=0;k<length;k++)
            {
            printfun((int)word[k]);
            }
        printnewline();
          }
      display(q->child[t]);//recursive call to display all the words
    }
  }    
  length--;
  return;
 }

  int search(struct trienode * root,char *key)
  {

  //TODO
  struct trienode * p = root;
  while(*key!='\0')
  {
    if(p->child[*key-'a']==NULL) //root is null
    {
      return 0;
    }
    p = p->child[*key - 'a'];
    key++;
  }
  if(p->endofword)//word found
  {
    return 1;
  }
  else{return 0;}//word not found
  }


 void delete_trie(struct trienode *root,char *key)
  {
    //TODO
    int t,pos;
    struct trienode* current;
    current=root;

    for(t=0;key[t]!='\0';t++)
    {
      pos=key[t]-'a';
      if(current->child[pos]==NULL)
      {
         return;
      }
      current=current->child[pos];
    }
      current->endofword=0;//just assigning the last character of the string's endofword to 0 makes the word not present in the trie,thereby deleting the word
      return;
  }

  int check(struct trienode *x)
  {
    //TODO
    int t,c=0;
	  for(t=0;t<26;t++)
	  {
		if(x->child[t]!=NULL)
    {
      c++;
    }
	  }
	  return c;//checks the length of the word
 }

  void push(struct trienode *x,int k)
  {
    //TODO
    ++top;//incrementing top
	  s[top].m=x;
	  s[top].index=k;
  } 

  struct stack pop()
  {
    //TODO
    struct stack p;
	  p=s[top--];//decrementing top
	  return p;
  }























 /*void display(struct trienode *curr)
 {
   int i,j;
   for(i=0;i<26;i++)
   {
     if(curr->child[i]!=NULL)
     {
       word[length++]=i+97;
       if(curr->child[i]->endofword==1)//if word found
       {
          printf("\n");//print the word
          for(j=0;j<length;j++)
             printf("%c",word[j]);
        }
       display(curr->child[i]);
     }
    }
    length--;
    return;
 }



 struct trienode *getnode()
 {
   int i;
   struct trienode *temp;
   temp=(struct trienode*)malloc(sizeof(struct trienode));
   for(i=0;i<26;i++)
    temp->child[i]=NULL;
  temp->endofword=0;
   return temp;
 }


 void insert(struct trienode * root, char *key)
 {
   int i,index;
   struct trienode *curr;
   curr=root;

   for(i=0;key[i]!='\0';i++)
   {
     index=key[i]-'a';
     if(curr->child[index]==NULL)
        curr->child[index]=getnode();
      curr=curr->child[index];
    }
    curr->endofword=1;
  }


 int search(struct trienode * root,char *key)
  {

  int i,index;
   struct trienode *curr;
   curr=root;

   for(i=0;key[i]!='\0';i++)
   {
     index=key[i]-'a';
     if(curr->child[index]==NULL)
        return 0;
      curr=curr->child[index];
    }
    if(curr->endofword==1)
       return 1;
   return 0;
  }

 void delete_trie(struct trienode *root,char *key)
  {
    int i,j,index,flag;
    struct trienode* curr;
    curr=root;
    flag=1;

    for(i=0;key[i]!='\0';i++)
    {
      index=key[i]-'a';
      if(curr->child[index]==NULL)
      {
         printf("Key not found\n");
         return;
      }
      curr=curr->child[index];
    }
      curr->endofword=0;
      return;
  }*/













 


 
 



















