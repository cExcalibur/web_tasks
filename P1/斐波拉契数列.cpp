#include<iostream>
using namespace std;
void converse(char a[])
{
	int length = strlen(a);
	for (int i = 0; i < length / 2; i++)
	{
		int temp = a[i];
		a[i] = a[length - 1 - i];
		a[length - 1 - i] = temp;
	}
}
void sum(char a[], char b[])
{
	for (int i = 0; i <strlen(b); i++)
	{
		a[i] += b[i] - '0';
		if (a[i]>'9')
		{
			a[i + 1] += (a[i] - '0') / 10;
			a[i] = (a[i] - '0') % 10+'0';                    //加法
		}
	}
}
int main()
{
	int i, j;
	char Fibon[105][100];
	strcpy(Fibon[0], "1");
	strcpy(Fibon[1], "1");
	for (i = 2; i < 105; i++)
	{
		for (j = 0; j<100; j++)
			Fibon[i][j] = '0';
	}
	for (i = 2; i < 100; i++)
	{
		sum(Fibon[i], Fibon[i - 1]);
		sum(Fibon[i], Fibon[i - 2]);
		for (j = 99; Fibon[i][j] == '0'; j--); 
		{
			Fibon[i][j + 1] = '\0';                    //找到第一个不为零的数
		}
	}
	for (i = 0; i < 100; i++)
	{
		converse(Fibon[i]);
	    printf("%s\n", Fibon[i]);                     //倒序输出
		
	}

	return 0;
}