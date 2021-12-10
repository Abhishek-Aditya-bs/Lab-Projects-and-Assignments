void tree_delete(Tree *tree, int element)
{
  Node *temp = tree->root;
  Node *p = NULL;
  Node *q = NULL;
  Node *inorder_successor = NULL;

    while (temp != NULL && temp->data != element) 
    {

        if (element > temp->data) 
        {
            p = temp;
            temp = temp->right;
        }

        else if (element < temp->data) 
        {
            p = temp;
            temp = temp->left;
        }
    }

    if (temp == NULL) 
    {
        return;
    }

    else if (temp->left == NULL) 
    {
        q = temp->right;
    }

    else if (temp->right == NULL) 
    {
        q = temp->left;
    }
        
    else 
    {
        // Find the inorder successor (next number in ascending 
        // order). It will be the min of the right subtree
        inorder_successor = temp->right;

        while (inorder_successor->left != NULL) 
        {
            inorder_successor = inorder_successor->left;
        }

        inorder_successor->left = temp->left;

        q = temp->right;
    }

    if (p == NULL) 
    {
        tree->root = q;
    }
    else if (temp == p->right) 
    {
        p->right = q;
    }
    else if (temp == p->left) 
    {
        p->left = q;
    }
    
    free(temp);
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
