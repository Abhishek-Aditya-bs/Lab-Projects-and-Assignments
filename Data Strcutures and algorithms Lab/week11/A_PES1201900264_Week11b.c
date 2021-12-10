#include<stdio.h>
#include "bfs.h"
int check_path(int **graph, int n, int v, int u)
{

  int visited_array[80];//declaring a visited array to store information regarding wehther a adjacent vertice is visited already or not 
  int que[80];//declaring an array to store the a vertice and all its adjacent vertices 
  int que_front =-1;
  int que_rear = -1;
  for(int i =0; i< n; i++) 
    {
      visited_array[i] = 0; //initializing all the elements of the visited array 0
    }

  do
  {
    
    if (que_front != que_rear)
    {
      que_front++;
      v = que[que_front];
      visited_array[v] = 1;
      if (u == v) //checking if the required vertices are connected and therefore there exists a path
      {
        return 1;
      }
    }
    
    for (int j=0; j<n; j++) //check for adjacent vertices
    {
      if(graph[v][j] && !visited_array[j])
      {
        que_rear++;
        que[que_rear] = j;//storing the j position in the queue to later check with u value
      }
    }
  }while(que_front != que_rear);


    return 0;
}
