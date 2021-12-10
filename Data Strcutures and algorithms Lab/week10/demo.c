#include<stdio.h>
#include<stdlib.h>
#include "tbt.h"

void tree_initialize(Tree *tree){
    tree->root = NULL;
}

void tree_insert(Tree *tree, int data){
    if(tree->root==NULL){
        Node * new = (Node *)malloc(sizeof(Node));
        new->data = data;
        new->left = new->right = NULL;
        new->leftThread = new->rightThread = 0;
        tree->root = new; //remember to make root point to this new node
        return;
    }
    //Create a new node as a leaf
    Node * new = (Node *)malloc(sizeof(Node));
    new->data = data;
    new->left = new->right = NULL;
    new->leftThread = new->rightThread = 0;
    
    Node * temp = tree->root;
    int inserted=0;
    while(temp!=NULL && !inserted){
        if(data < temp->data){
            if(temp->left==NULL){
                temp->left = new;
                new->right = temp;
                temp->leftThread=0;
                new->rightThread=1;
                inserted=1;
            }
            else if(temp->leftThread){
                Node * predecessor = inorder_predecessor(temp);
                temp->leftThread=0; //kill the previouse left thread
                temp->left = new; 
                new->left = predecessor;
                new->leftThread=new->rightThread=1;  //initiate new left and right threads for node inserted
                new->right=temp;
                inserted=1;
            }            
            else
            temp = temp->left;
        }
        else{
            if(temp->right==NULL){
                temp->right = new;
                new->left = temp;
                temp->rightThread=0;
                new->leftThread = 1; //initiate new left thread.
                inserted=1;
            }
            else if(temp->rightThread){
                Node * prevRight = inorder_successor(temp);
                temp->right = new;
                temp->rightThread=0; //kill previous right thread.
                new->rightThread=new->leftThread=1; //initiate new left and right threads for node inserted.
                new->right = prevRight;
                new->left = temp;
                inserted=1;
            }
            else
            temp = temp->right;
        }
    }
}

Node *inorder_predecessor(Node *ptr){
   return ptr->left;
}

Node *inorder_successor(Node *ptr){
   return ptr->right;
}

void print_ascending(Tree *tree){
    if (tree->root == NULL){
        printf("Empty\n");
        return;
    }
    else{
        Node * temp = tree->root;
        Node * stack[100];
        int top=-1;
        do{
            while(temp!=NULL){
                stack[++top] = temp;
                temp = !temp->leftThread ? temp->left : NULL;
            }
            temp = stack[top--];
            printfun(temp->data);
            temp = !temp->rightThread ? temp->right : NULL;
        }while(temp!=NULL || top!=-1);
    }
    nextline();
}

void print_descending(Tree *tree){
    if (tree->root == NULL){
        printf("Empty\n");
        return;
    }
    else{
        Node * temp = tree->root;
        Node * stack[100];
        int top=-1;
        do{
            while(temp!=NULL){
                stack[++top] = temp;
                temp = !temp->rightThread ? temp->right : NULL;
            }
            temp = stack[top--];
            printfun(temp->data);
            temp = !temp->leftThread ? temp->left : NULL;
        }while(temp!=NULL || top!=-1);
    }
    nextline();
}

void destroy(Node *r){
   if(r!=NULL){
        !r->leftThread ? destroy(r->left) : NULL;
       !r->rightThread ? destroy(r->right) : NULL;
       free(r);
   }
   
}

void tree_destroy(Tree *t){
    if(t==NULL) return;
    destroy(t->root);
}