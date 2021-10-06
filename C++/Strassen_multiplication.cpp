//Strassen's method
//Strassen's method reduces multplication calls from 8 to 7 times
// example 
//a[a b]  b[e f]
// [c d]   [g h]
//this is also similar to Divide and Conquer,but here four submatrices of result are calculated using formula
//p1 = a(f-h)   p2 = (a+b)h   p3 = (c+d)e   p4 = d(g-e)   p5 = (a+d)(e+h)   p6 = (b-d)(g+h)   p7 - (a-c)(e+f)
//c = axb   c[p5+p4-p2+p6  p1+p2]
//           [p3+p4   p1+p5-p3-p7]
//Time = O(n2)    T(n) = 7T(n/2) + O(n2) ~ O(n^log7) ~ O(n^2.8074)
#include<bits/stdc++.h>
using namespace std;
int main()
{
	int a[2][2]={{1,2},{3,4}};
	int b[2][2]={{2,3},{4,5}};
	int c[2][2];
	int p1,p2,p3,p4,p5,p6,p7;
	p1=a[0][0]*(b[0][1]-b[1][1]);
	p2=(a[0][0]+a[0][1])*b[1][1];
	p3=(a[1][0]+a[1][1])*b[0][0];
	p4=a[1][1]*(b[1][0]-b[0][0]);
	p5=(a[1][0]+a[1][1])*(b[0][0]+b[0][1]);
	p6=(a[0][1]-a[1][1])*(b[1][0]+b[1][1]);
	p7=(a[0][0]-a[1][0])*(b[0][0]+b[0][1]);
	c[0][0]=p5+p4-p2+p6;
	c[0][1]=p1+p2;
	c[1][0]=p3+p4;
	c[1][1]=p1+p5-p3-p7;
	for(int i=0;i<2;i++)
	{
		for(int j=0;j<2;j++)
		{
			cout<<c[i][j]<<" ";
		}
		cout<<endl;
	}
	return 0;
}
