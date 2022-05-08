#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "abstract_syntax_tree.h"

expression_node* init_exp_node(char* val, expression_node* left, expression_node* right)
{
	// function to allocate memory for an AST node and set the left and right children of the nodes
	expression_node* node = (expression_node*) malloc(sizeof(expression_node));
	node->left = left;
	node->val = val;
	node->right = right;
	return node;
}
if_node* init_if_node(expression_node* cond, if_node* true, if_node* false, char * val)
{
	// function to allocate memory for an AST node and set the left and right children of the nodes
	if_node* node = (if_node*) malloc(sizeof(if_node));
	node->cond = cond;
	node->true = true;
	node->false = false;
	node->val = val;
	return node;
}

void display_exp_tree(expression_node* exp_node)
{
	// traversing the AST in preorder and displaying the nodes
	if(exp_node == NULL)
		return;
	printf("%s, ",exp_node->val);
	display_exp_tree(exp_node->left);
	display_exp_tree(exp_node->right);
}

void display_if_tree(if_node* node)
{
	// traversing the AST in preorder and displaying the nodes
	if(node == NULL)
		return;
	if(strcmp(node->val,"ASSGN") == 0){
		// printf("%p %p\n", node->true,node->cond);
		display_exp_tree(node->cond);
		display_if_tree(node->true);
		display_if_tree(node->false);
		return;
	}
	
	printf("%s ",node->val);
	if(strcmp(node->val,"seq") == 0){
		// printf("%p %p\n", node->true,node->cond);
		node = node->true;
		// display_exp_tree(node->cond);
		while(node != NULL){
			display_exp_tree(node->cond);
			display_if_tree(node->true);
			node = node->false;
		}
		return;
		// printf("%p %p\n", node->true,node->cond);
	}
	display_exp_tree(node->cond);
	display_if_tree(node->true);
	display_if_tree(node->false);
}