#include<stdio.h>
#include "bfs.h"
# define MAX 100
int check_path(int **graph, int n, int v, int u)
{

  int visited[100];
  int queue[100];
  int qhead =-1;
  int qtail = -1;
  for(int i =0; i< n; i++) visited[i] = 0; // initialise

  do{
    // visit element from queue
    if (qhead != qtail){
      qhead++;
      v = queue[qhead];
      visited[v] = 1;
      if (u == v) return 1;
    }
    // push all adjacent nodes to the queue
    for (int j=1; j<n; j++){
      if(graph[v][j] && !visited[j]){
        qtail++;
        queue[qtail] = j;
      }
    }
  }while(qhead != qtail);


    return 0;
}
