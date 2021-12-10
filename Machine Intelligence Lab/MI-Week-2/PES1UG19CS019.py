"""
You can create any other helper funtions.
Do not modify the given functions
"""

import time
def A_star_Traversal(cost, heuristic, start_point, goals):
    """
    Perform A* Traversal and find the optimal path 
    Args:
        cost: cost matrix (list of floats/int)
        heuristic: heuristics for A* (list of floats/int)
        start_point: Staring node (int)
        goals: Goal states (list of ints)
    Returns:
        path: path to goal state obtained from A*(list of ints)
    """
    # initializing all the required lists required for A* Search
    path = []

    total_cost = [] # f(n)
    current_cost = [] # g(n)
    parent_list = [] # list containing the predecessor of every node traversed during the search

    # appending large values into the lists f(n) , g(n), list containing the predecessor of nodes 
    for i in range(1,len(cost[1])):
        total_cost.append(1e6) 
        current_cost.append(1e6)
        parent_list.append(0)
    
    # initializing g(start_point) as 0
    current_cost[start_point-1] = 0
    # initializing f(start_point) as h(start_point)
    total_cost[start_point-1] = heuristic[start_point]


    explored = [] # explored list tracks of all the previously visited nodes  
    frontier = [] # priority queue in which the priority is based on the f(n) values of the nodes

    if start_point < 0: return [] # if starting point is -ve return an empty list
    if start_point in goals: return [start_point] # return path containing start_point if start_point itself is the goal  
    frontier.append([total_cost[start_point-1],start_point]) # append the start_point to the priority queue along with its f(n) value

    while (len(frontier)):
        # extract the minimum node containg the least f(n) value from the priority queue
        curr_cost,vertex = min(frontier,key=lambda x: (total_cost[x[1] - 1],x[1])) 

        # if vertex is in the goals we backtrack to the startting_point via the predecessor of the nodes 
        # and return the path
        if vertex in goals:
            insert_at = 0
            path[insert_at:insert_at] = [vertex]

            ev = vertex
            for k in range(1,len(parent_list) + 1):
                predecessor = parent_list[ev-1]
                path[insert_at:insert_at] = [predecessor]
                # when the start_point is reached break from the loop
                if predecessor == start_point:
                    break
                else : 
                    ev = predecessor
            break

        # appending the unvisted node to the visited list and removing the unvisted node from the queue
        explored.append([curr_cost,vertex])
        frontier.remove([curr_cost,vertex])
        
        # store all the children of the unvisted node into the children list
        children  = []
        for c in range(1,len(cost[1])):
            if cost[vertex][c] > 0:
                children.append(c)

        for child in children:
            #store all the explored nodes into ch list
            ch = []
            for e in explored:
                ch.append(e[1])
            # if child is already explored continue without doing anything
            if child in ch:  
                continue
            
            # calculate the cost(n,a,n') + g(n)
            inter_cost = cost[vertex][child] + current_cost[vertex-1]

            # if cost(n,a,n') + g(n) <= g(child)
            if inter_cost <= current_cost[child-1]: 
                current_cost[child-1] = inter_cost
                # f(n) = g(n) + h(n)
                total_cost[child-1] = current_cost[child-1] + heuristic[child]
                # store the parent of the child as the vertex last explored
                parent_list[child-1] = vertex
  
            else: 
                continue
            
            # store all the nodes in priority queue in fr list
            fr = []
            for f in frontier:
                fr.append(f[1])

            # append the child into the priority queue along with its f(n) value if its unvisited 
            if child not in fr:
                frontier.append([total_cost[child-1],child])
    return path


def DFS_Traversal(cost, start_point, goals):
    """
    Perform DFS Traversal and find the optimal path 
        cost: cost matrix (list of floats/int)
        start_point: Staring node (int)
        goals: Goal states (list of ints)
    Returns:
        path: path to goal state obtained from DFS(list of ints)
    """
    # initialize all the lists required for DFS traversal
    path = []
    # visited list keeps track of all the vertices visited
    visited = []
    # append the visited list with 0's
    for j in range(1,len(cost[1])):
        visited.append(0)
    # begin the recursion of the dfs fucntion
    dfs(start_point,cost,visited,path,goals)
    return path

# recursive function
def dfs(start_point,cost,visited,path,goals):
    # only if the start_point is greater than 0 perform the search
    if start_point > 0:
        # append the start_point to the visited array
        visited[start_point - 1] = 1
        # append the start_point to the path 
        path.append(start_point)
        # if start_point is in goals list then exit the function and return the path
        if start_point in goals:
            return -1
        # if the node next explored is not in the goals and not visited and has cost > 0 which means its a neighbour
        # proceed with the DFS traversal by recursion by passing the node into the recursive function
        for i in range(1,len(cost[1])):
            if(cost[start_point][i] > 0 and visited[i - 1] == 0):
                k = dfs(i,cost,visited,path,goals)
                # if goal state is reached in any of the recursive calls return and backtrack to the calling function
                # and return the path
                if k == -1:
                    return -1
        # pop the node from the stack if dead-end is reached and and backtrack
        path.pop()
        return 0
    else:
        return 0

