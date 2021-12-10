#include "et.h"

Node * createExpressionTree(char* a,int len)
{
    //TODO
    if(len == 0) 
      return NULL;
    Node *left_node; 
    Node *right_node;
    int index; 
    int top=-1;
    Node *stk[len];
    for(index=0;index<len;index++)
    {
      Node *temp=(Node*)malloc(sizeof(Node));
      temp->data=a[index];
      temp->left=NULL;
      temp->right=NULL;
      temp->prev=NULL;
      if( a[index] =='+' || a[index]=='-' || a[index]=='/' || a[index]=='*' || a[index]=='%' || a[index]=='$')
      {
        right_node=stk[top--];
        left_node=stk[top--];
        temp->right=right_node;
        temp->left=left_node;
        left_node->prev=temp;
        right_node->prev=temp;
        stk[++top]=temp;
      }
      else
      {
        stk[++top]=temp;
      }
    }
    return stk[0];
}


void inorder(Node *root)
{
 //TODO 
 // Note : Do not change the printf
 if(root!=NULL)
 {
    inorder(root->left);
    printf("%c",root->data); 
    inorder(root->right);
 } 
}

void preorder(Node *root)
{
 //TODO 
 // Note : Do not change the printf
 if(root!=NULL)
 {
    printf("%c",root->data); 
    preorder(root->left);
    preorder(root->right);
 }     
}

void postorder(Node *root)
{
 //TODO 
 // Note : Do not change the printf
 if(root!=NULL)
 {
    postorder(root->left);
    postorder(root->right);
    printf("%c",root->data); 
 }
}

void freeTree(Node *root)
{
  if(root!=NULL)
  {
    freeTree(root->left);
    freeTree(root->right);
    free(root);
    if(root->left!=NULL)
      root->left=NULL;
    if(root->right!=NULL)
      root->right=NULL;
    root=NULL;
  }
}

