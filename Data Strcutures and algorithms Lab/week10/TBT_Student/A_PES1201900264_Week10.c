#include<stdio.h>
#include<stdlib.h>
#include "tbt.h"

void tree_initialize(Tree *tree)
{
    tree->root = NULL; //initializing the root of the tree as NULL
}

void tree_insert(Tree *tree, int data)
{
    if(tree->root==NULL) //if the root is null make the new node as the root
    {
        Node * new_node = (Node *)malloc(sizeof(Node));
        new_node->data = data;
        new_node->left = new_node->right = NULL;
        new_node->leftThread = new_node->rightThread = 0;
        tree->root = new_node; 
        return;
    }
    
    Node * new_node = (Node *)malloc(sizeof(Node));
    new_node->data = data;
    new_node->left = new_node->right = NULL;
    new_node->leftThread = new_node->rightThread = 0;
    
    Node * p = tree->root;
    int node_inserted=0;
    while(p!=NULL && !node_inserted)
    {
        if(data < p->data) //node to be inserted is in the left subtree 
        {
            if(p->left==NULL)
            {
                p->left = new_node;
                new_node->right = p;
                p->leftThread=0;
                new_node->rightThread=1;
                node_inserted=1;
            }
            else if(p->leftThread)
            {
                Node * predec = inorder_predecessor(p); //inorder predecessor gives the previous node of a particular node in inorder traverssal order
                p->leftThread=0; 
                p->left = new_node; 
                new_node->left = predec;
                new_node->leftThread=new_node->rightThread=1; 
                new_node->right=p;
                node_inserted=1;
            }            
            else
            p = p->left;
        }
        else
        { //node to be inserted in right subtree
            if(p->right==NULL)
            {
                p->right = new_node;
                new_node->left = p;
                p->rightThread=0;
                new_node->leftThread = 1; 
                node_inserted=1;
            }
            else if(p->rightThread)
            {
                Node * incsucc = inorder_successor(p);//inorder successor gives the next node of a particular node in inorder traverssal order
                p->right = new_node;
                p->rightThread=0; 
                new_node->rightThread=new_node->leftThread=1;
                new_node->right = incsucc;
                new_node->left = p;
                node_inserted=1;
            }
            else
            p = p->right;
        }
    }
}

Node *inorder_predecessor(Node *ptr)
{
   return ptr->left;
}

Node *inorder_successor(Node *ptr)
{
   return ptr->right;
}

void print_ascending(Tree *tree)
{
    if (tree->root == NULL)
    {
        printf("Empty\n");
        return;
    }
    else
    {
        Node * p = tree->root;
        Node * stack[100];
        int top=-1;
        do
        {
            while(p!=NULL)
            {
                stack[++top] = p;
                if(!p->leftThread) //if there is no left threa moved down the left sub tree
                {
                    p=p->left;
                }
                else 
                {
                    p=NULL;
                }
               
            }
            p = stack[top--];
            printfun(p->data);
                if(!p->rightThread) // if there is no right thread move down the right sub tree
                {
                    p=p->right;
                }
                else 
                {
                    p=NULL;
                }
        }while(p!=NULL || top!=-1);
    }
    nextline();
}

void print_descending(Tree *tree)
{
    if (tree->root == NULL)
    {
        printf("Empty\n");
        return;
    }
    else
    {
        Node * p = tree->root;
        Node * stack[80];
        int top=-1;
        do
        {
            while(p!=NULL)
            {
                stack[++top] = p;
                if(!p->rightThread) // if there is no right thread move down the right sub tree
                {
                    p=p->right;
                }
                else 
                {
                    p=NULL;
                }
                
            }
            p = stack[top--];
            printfun(p->data);
            if(!p->leftThread) //if there is no left threa moved down the left sub tree
                {
                    p=p->left;
                }
                else 
                {
                    p=NULL;
                }
        }while(p!=NULL || top!=-1);
    }
    nextline();
}

void destroy(Node *r)
{
    if (r == NULL) return;
    if (r->left == NULL && r->right == NULL) 
    {
        free(r);
        return;
    }
    if (r->left != NULL && r->leftThread == 0) 
    {
        destroy(r->left);
    }

    if (r->right != NULL && r->rightThread == 0) 
    {
        destroy(r->right);
    }
}

void tree_destroy(Tree *t)
{//destroying the allocated space by using free function
    if(t==NULL) return;
    destroy(t->root);
}