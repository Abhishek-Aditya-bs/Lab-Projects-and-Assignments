#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
char* itoa(int val, int base){
	
	static char buf[32] = {0};
	
	int i = 30;
	
	for(; val && i ; --i, val /= base)
	
		buf[i] = "0123456789abcdef"[val % base];
	
	return &buf[i+1];
	
}

int main()
{
    char* val = "54325.222";
    printf("Float Value = %d\n", atoi(val));
    return 0;
}