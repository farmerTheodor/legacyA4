#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#define n 1000

int main(int argc, char const *argv[])
{
	int len = floor(10 * n/3) + 1;
	int * a =(int*)malloc(len * sizeof(int*));
	char fileName[100] = "";
	FILE *fp;

	for(int i = 0; i < len; ++i) {
		a[i] = 2;
	}

	int nines = 0;
	int predigit = 0;

	printf("please give a filename\n");
	scanf("%s", fileName);
   fp = fopen(fileName, "w+");
   
	for( int j = 1; j < n + 1; ++j) {        
		int q = 0;

		for(int i = len; i > 0; --i) {
			int x  = 10 * a[i-1] + q*i;
			a[i-1] = x % (2*i - 1);
			q = x / (2*i - 1);
		}

		a[0] = q%10;
		q = q/10;

		if (9 == q) {
			nines = nines +1;
		}
		else if (10 == q) {
			fprintf(fp, "%d", predigit + 1);
			for (int k = 0; k < nines; ++k) {
				fprintf(fp, "%d", 0);
			}
			predigit = 0;
			nines = 0;
		}
		else {
			fprintf(fp, "%d", predigit);
			predigit = q;
			if (0 != nines) {    
				for (int k = 0; k < nines; ++k) {
					fprintf(fp, "%d", 9);
				}
				nines = 0;
			}
		}
	}
	fprintf(fp, "%d\n", predigit);
	fclose(fp);
	return 0;
}

