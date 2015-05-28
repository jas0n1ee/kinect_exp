#include "exp.h"
#include <cstdlib>
int compare (const void * a, const void * b)
{
  return ( *(int*)a - *(int*)b );
}
int median(int arr[],int len)
{
	qsort(arr,sizeof(int),len,compare);
	return arr[len/2];
}