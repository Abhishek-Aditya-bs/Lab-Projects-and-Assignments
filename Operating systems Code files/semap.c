#include<semaphore.h>
//Named semaphore
sem_t *sem;
sem=sem_open("SEM",O_CREAT,0666,1);
sem_wait(sem);
sem_post(sem);

//unamed semaphore
sem_t sem;
sem_init(&sem,0,1);
sem_wait(&sem);
sem_post(&sem);
