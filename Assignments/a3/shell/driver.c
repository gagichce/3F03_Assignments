#include <stdio.h>
#include <stdlib.h>

void genRandArray(int * A, int n);
int asm_main();
int shellsort(int * A, int n);
void shellsort2(int * A, int n);
void shellsort3(int * A, int n);
int comp (const void * a, const void * b);
void checkSorting(int * A, int n);
int clock();

int main()
{
	int ret_status;
	//ret_status = shellsort((int*)0, 7);
	
	for(int i = 1; i < 11; i++){
		int *ptr;
		int length = i*10000000;
		
		ptr = (int*)malloc(length*sizeof(int));
		if(ptr==NULL){
			printf("Memory could not be allocated! You must download more rams!\n"); 
			return 0;
		}

		genRandArray(ptr, length);
		//print(ptr, length);
		clock_t startTime = clock();		
		shellsort(ptr, length);
		clock_t endT = clock();
		//print(ptr, length);
		double totalT = (double) (endT - startTime)/1000000;
		checkSorting(ptr, length);

		printf("%d %f\n", length, totalT);		

		//printf("%d\n", *(ptr));
		free(ptr);
	}	

	return ret_status;
}

//this assumes the memory has already been allocated, just needs to be filled
void genRandArray(int * A, int n)
{
	//printf("making array of rands %d long\n", n);
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

int comp (const void * a, const void * b)
{
	return ( *(int*)a - *(int*)b );
}

void shellsort3( int * A, int n )
{
	qsort(A, n, sizeof(int), comp);
}


