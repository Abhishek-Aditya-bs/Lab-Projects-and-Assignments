typedef struct expression_node
{
	struct expression_node* left;
	struct expression_node* right;
	char* val;
}expression_node;

typedef struct if_node
{
	char* val;
	struct expression_node* cond;
	struct if_node* true;
	struct if_node* false;

}if_node;


expression_node* init_exp_node(char* val, expression_node* left, expression_node* right);
if_node* init_if_node(expression_node* cond, if_node* true, if_node* false, char* val );
void display_exp_tree(expression_node* exp_node);
void display_seq_tree(expression_node* exp_node);
void display_if_tree(if_node* node);
