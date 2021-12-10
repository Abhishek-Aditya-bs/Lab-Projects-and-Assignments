#include<stdio.h>
#include "bfs.h"
int check_path(int **graph, int n, int v, int u)
{
	int w;
	int visitedNode [100];
	for(int i=0;i<100;i++)
		visitedNode[i]=0;
	int queue[50];
	int front,rear;
	front=rear=-1;
	visitedNode[v] = 1; // visited v node.
	// printf("%d ",v+1);
	rear=front=0;
	queue[rear] = v;
	// front=rear;
	while(!(front==-1 && rear==-1))
	{
		v=queue[front];
		if(front==rear){
			front=rear=-1;
		}
		else front++;
	  for(w=1;w<n;w++){
		if(graph[v][w]==1 && w==u)
			return 1;
		if((graph[v][w]==1)&& visitedNode[w]==0)
		{
			visitedNode[w]=1;
			// printf("%d ",w);
			queue[++rear] = w;
			front++;
		}
		}
    }
	return 0;
}	
