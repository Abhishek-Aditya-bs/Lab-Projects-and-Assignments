#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<sys/wait.h>

int main()
{
int pid,status,c;
pid=fork();
if(pid<0)
{	printf("fork failed\n");
	exit(1);
}
else if(pid==0)
{	printf("child process\n");
	printf("id of parent=%d, id of child=%d\n",getppid(),getpid());
	c=execl("/home/abhishek/Desktop/OS-code/ex23","ex23",NULL);
}
else
{	wait(&status);	
	printf("parent process %d\n",c);
	printf("id parent=%d,id of child=%d\n",getpid(),pid);
}
return 0;
}

