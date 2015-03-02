#include <stdio.h>
#include <stdlib.h>

void genRandArray(int * A, int n);
int asm_main();
int shellsort(int * A, int n);

int main()
{
	int ret_status;
	ret_status = shellsort((int*)0, 7);
	
	for(int i = 1; i < 11; i++){
		int *ptr;
		int length = i*10000000;
		ptr = (int*)malloc(length*sizeof(int));
		if(ptr==NULL){
			printf("Memory could not be allocated! You must download more rams!"); 
			return 0;
		}
	//	genRandArray(ptr, length);

		printf("Time is : %d\n", clock());		

		printf("%d\n", *(ptr));
		free(ptr);
	}	

	return ret_status;
}

//this assumes the memory has already been allocated, just needs to be filled
void genRandArray(int * A, int n)
{
	printf("making array of rands %d long\n", n);
	for (int i = 0; i < n; i++){
		*(A + i) = rand();
	}
	//flushin' because buffers
	fflush(stdout);
}
