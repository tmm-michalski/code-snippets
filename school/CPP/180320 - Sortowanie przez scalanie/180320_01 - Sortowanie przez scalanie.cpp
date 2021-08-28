#include <iostream>
using namespace std;
const int MAX = 100;
void wyswietl(double T[], int n)
{
	cout<<"tablica:"<<endl;
	for (int i=0;i<n;i++)
		{
		cout<<T[i]<<"\t";
		} 
}

void scalaj(double T[], int lewy, int prawy)
{
	int i, i_lewy, i_prawy, srodek;
	double pom[MAX];
	for(i=0;i<MAX;i++)
		{
		pom[i]	= T[i];
		} 
	srodek = (lewy+prawy)/2;
	i=lewy;
	i_lewy=lewy;
	i_prawy=srodek+1;
	while (i_lewy<=srodek && i_prawy<=prawy)
	{
		if (pom[i_lewy]<pom[i_prawy])
		{
			T[i]=pom[i_lewy];
			i_lewy++;
		}
		else
		{
			T[i]=pom[i_prawy];
			i_prawy++;
		}
		i++;
	}
	if(i_lewy>srodek)
		while (i_prawy<=prawy)
		{
			T[i]=pom[i_prawy];
			i_prawy++;
			i++;
		}
	else
		while (i_lewy<=srodek)
		{
			T[i]=pom[i_lewy];
			i_lewy++;
			i++;
		}
}
void sortuj (double T[], int lewy, int prawy)
{
	int srodek=(lewy+prawy)/2;
	if (lewy<srodek) sortuj(T,lewy,srodek);
	if (srodek+1<prawy) sortuj(T,srodek+1,prawy);
	scalaj(T,lewy,prawy);
}
main()
{
	double T[MAX];
	int n;
	cout<<"Podaj luczbe elementow tablicy: ";
	cin>>n;
	cout<<"podaj elementy tablicy: "<<endl;
	for(int i=0;i<n;i++)
	{
		cout<<"T["<<i<<"] = ";
		cin>>T[i];
	}
	cout<<"Wczytana "; 
	wyswietl(T,n);
	sortuj(T,0,n-1);
	cout<<endl<<"Posortowana "; 
	wyswietl(T,n);
	return 0;
}
