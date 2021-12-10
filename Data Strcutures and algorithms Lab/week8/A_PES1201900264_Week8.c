#include<stdio.h>
#include "bst.h"
void tree_initialize(Tree *tree)
{
  tree->root = NULL;
}

void tree_insert(Tree *tree, int data)
{ 
  Node *temp,*p,*q;
  temp = (Node *)malloc(sizeof(Node));
  temp->data = data;
  temp->left = NULL;
  temp->right = NULL;
  if(tree->root==NULL)
    {
      tree->root = temp;
      return;
    }
  p = tree->root;
  q=NULL;
  while(p!=NULL)
  {
    q=p;
    if(temp->data<p->data)
      p = p->left;
    else
      p = p->right;
  }
  if(temp->data<q->data)
    q->left = temp;
  else
    q->right = temp;
}

void tree_delete(Tree *tree, int element)
{
  if(tree == NULL || tree->root == NULL)
  {
    return;
  }
  Node *p = tree->root;
  Node *q = tree->root;
  while(p!=NULL)
  {
    if(element<p->data)
    {
      q = p;
      p = p->left;
    }
    else if(element>p->data)
    {
      q = p;
      p = p->right;
    }
    else
    {
      if(p->left == NULL && p->right == NULL)
      {
        if(q->left == p)
          q->left = NULL;
        else if(q->right == p)
          q->right = NULL;
        else
          tree->root = NULL;
        free(p);
        p = NULL;
      }
      else if(p->left == NULL)
      {
        Node *temp = p;
        if(q->left == p)
        {
          p = p->right;
          q->left = p;
        }
        else if(q->right == p)
        {
          p = p->right;
          q->right = p;
        }
        else
        {
          p = p->right;
          q = NULL;
          tree->root = p;
        }
        free(temp);
      }
      else if(p->right == NULL)
      {
        Node *temp = p;
        if(q->left == p)
        {
          p = p->left;
          q->left = p;
        }
        else if(q->right == p)
        {
          p = p->left;
          q->right = p;
        }
        else
        {
          p = p->left;
          q = NULL;
          tree->root = p;
        }
        free(temp);
      }
      else
      {
        Node *p1 = p->right;
        Node *q1;
        while(p1->left!=NULL)
        {
          q1 = p1;
          p1 = p1->left;
        }
        p->data = p1->data;
        if(p->right == p1)
        {
          p->right = p1->right;
        }
        else
        {
          q1->left = NULL;
        }
        free(p1);
        p1 = NULL;
      }
    }
  }
}

void tree_inorder(Node *r)
{
  if(r!=NULL)
  {
    tree_inorder(r->left);
    printf("%d ",r->data);
    tree_inorder(r->right);
  }
}

void tree_preorder(Node *r)
{
  if(r!=NULL)
  {
    printf("%d ",r->data);
    tree_preorder(r->left);
    tree_preorder(r->right);
  }
}

void tree_postorder(Node *r)
{
  if(r!=NULL)
  {
    tree_postorder(r->left);
    tree_postorder(r->right);
    printf("%d ",r->data);
  }
}

void postorder(Tree *t)
{
  if(t->root== NULL || t==NULL)
    return;
  else
    tree_postorder(t->root);
  printf("\n");
}

void preorder(Tree *t)
{
  if(t->root== NULL || t==NULL)
    return;
  else
    tree_preorder(t->root);
  printf("\n");
}

void inorder(Tree *t)
{
  if(t->root== NULL || t==NULL)
    return;
  else
    tree_inorder(t->root);
  printf("\n");
}

void destroy(Node *r)
{
  if(r!=NULL)
  {
    destroy(r->left);
    destroy(r->right);
    free(r);
    if(r->left!=NULL)
      r->left=NULL;
    if(r->right!=NULL)
      r->right=NULL;
    r=NULL;
  }
}

void tree_destroy(Tree *t)
{ 
  destroy(t->root);
  t=NULL;
}
