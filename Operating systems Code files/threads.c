#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void *average( void *ptr );
void *minimum(void *ptr);
void *maximum(void *ptr);

int sum,avg,min,max;

int main()
{    int scope;
     pthread_t thread1,thread2,thread3;//thread identifier
     pthread_attr_t attr;
     char *a="9";
     int  iret1, iret2,iret3;//thread will return 0 if success
     
     pthread_attr_init(&attr);//get the default attributes
     
     if(pthread_attr_getscope(&attr,&scope) !=0)//checking if the function is success and also getting the scope
     { printf("unable to get scheduling scope\n"); }
     else 
     {
     	if(scope==PTHREAD_SCOPE_PROCESS) printf("Pthread scope process\n");
     	else if(scope==PTHREAD_SCOPE_SYSTEM) printf("pthread scope system\n");
     	else printf("illegal scope\n");
     }
     
     pthread_attr_setscope(&attr,PTHREAD_SCOPE_SYSTEM);//linux allows only pthread scope system
     
     

    /* Create independent threads each of which will execute function */

     //iret1 = pthread_create( &thread1, NULL, average, (void *) a);//thread creation ver1
     iret1 = pthread_create( &thread1, &attr, average, (void *) a);//thread creation ver1
     iret2 = pthread_create( &thread2, &attr, minimum, (void*) a);
     iret3 = pthread_create( &thread3, &attr, maximum, (void*) a);

     /* Wait till threads are complete before main continues. Unless we  */
     /* wait we run the risk of executing an exit which will terminate   */
     /* the process and all threads before the threads have completed.   */

     pthread_join( thread1, NULL);
     pthread_join( thread2, NULL); 
     pthread_join( thread3, NULL);

     printf("Thread 1 returns: %d\n",iret1);
     printf("Thread 2 returns: %d\n",iret2);
     printf("Thread 2 returns: %d\n",iret3);
     exit(0);
     
     return 0;
}

void *average( void *ptr )
{    int upper=atoi(ptr);
 	for(int i=0;i<upper;i++)
 		{ sum=sum+i;}
 	avg=sum/7;
 	printf("the average value is %d\n",avg);
 	pthread_exit(0);  
} 
void *minimum( void *ptr )
{    int upper=atoi(ptr);
	min=100;
 	for(int i=0;i<upper;i++)
 		{ if(i<min) min=i;}
 	printf("the minimum value is %d\n",min);
 	pthread_exit(0);  
} 
void *maximum( void *ptr )
{    int upper=atoi(ptr);
	max=-1;
 	for(int i=0;i<upper;i++)
 		{ if(i>max) max=i;}
 	printf("the maximum value is %d\n",max);
 	pthread_exit(0);  
} 




