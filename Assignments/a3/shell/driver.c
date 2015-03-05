#include <stdio.h>
#include <stdlib.h>

void genRandArray(int * A, int n);
int asm_main();
int shellsort(int * A, int n);
void shellsort2(int * A, int n);

int main()
{
	int ret_status;
	//ret_status = shellsort((int*)0, 7);
	
	for(int i = 1; i < 11; i++){
		int *ptr;
		int length = i*10000000;
		ptr = (int*)malloc(length*sizeof(int));
		if(ptr==NULL){
			printf("Memory could not be allocated! You must download more rams!"); 
			return 0;
		}

		genRandArray(ptr, length);
		//print(ptr, length);
		shellsort2(ptr, length);
		//printf("\n");
		//print(ptr, length);		
		checkSorting(ptr, length);

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

void checkSorting(int * A, int n){
	int i;
	for (i = 0; i < n-1; i++){
		if(A[i] > A[i+1]){
			printf("Error in the sort!");
			exit(-1);
		}
	}
}

void print(int * A, int n){
	int i;
	for (i = 0; i < n; i++){
		printf("%d\n", A[i]);
	}
}

void shellsort2( int * A, int n )
{
	int gap, i, j, temp;
	for(gap = n/2; gap > 0; gap /=2){
		for( i = gap; i < n; i++){
			for(j = i - gap; j >= 0 && A[j] > A[j + gap]; j -= gap){
				temp = A[j];
				A[j] = A[j + gap];
				A[j + gap] = temp;
			}
		}
	}
}
