#include "pch.h"

#include "GeneratorOfTheSetOfAllSubsets.h"
#include "CombinationGenerator.h"
#include "PermutationGenerator.h"
#include "PlacementGenerator.h"

#define N (sizeof(AA)/2)
#define M 3

int _tmain(int argc, _TCHAR* argv[])
{
	setlocale(LC_ALL, "Rus");
	char  AA[4][2] = {{'A', '\0'},
				      {'B', '\0'},
				      {'C', '\0'},
				      {'D', '\0'} 
	};


	cout << "---------- Tasks 1 -- 4 ----------" << endl;


	cout << "Generator of the set of all subsets:" << endl << endl;
	cout << "{ ";
	for (int i{}; i < sizeof(AA) / 2; i++)
		cout << AA[i][0] << ((i < sizeof(AA) / 2 - 1) ? ", " : " ");
	cout << "} " << endl << endl;

	cout << "Generating all subsets:" << endl;

	GeneratorOfTheSetOfAllSubsets::Generator_S s1(sizeof(AA) / 2);     
	int n = s1.getFirst();
	while (n >= 0)                         
	{
		cout << endl << "{ ";
		for (int i = 0; i < n; i++)
			cout << AA[s1.getElementOfTheIndexArray(i)] << ((i < n - 1) ? ", " : " ");
		cout << "}";
		n = s1.getNext();                  
	};

	cout << endl << endl;
	cout << "Total subsets: " << s1.numberOfSubsets() << endl << endl << endl;

	cout << "Combination generator: " << endl;

	char  BB[5][2] = {{'A', '\0'},
					  {'B', '\0'},
					  {'C', '\0'},
					  {'D', '\0'},
	                  {'E', '\0'}
	};

	cout << endl << "Initial set: ";
	cout << "{ ";
	for (int i = 0; i < sizeof(BB) / 2; i++)
		cout << BB[i][0] << ((i < sizeof(BB) / 2 - 1) ? ", " : " ");
	cout << "}" << endl;

	int amountOfElements{};
	cout << "Enter the number of elements that will make up the combinations: ";
	cin >> amountOfElements;

	cout << endl << "Generating combinations : ";
	CombinationGenerator::Generator_C xc(sizeof(BB) / 2, amountOfElements);
	cout << "from " << xc.elementsOfTheOrSet << " to " << xc.elementsInCombinations;
	int  m = xc.getfirst();
	while (m >= 0)
	{
		cout << endl << xc.combNum << ": { ";
		for (int i = 0; i < m; i++)
			cout << BB[xc.ntx(i)] << ((i < m - 1) ? ", " : " ");
		cout << "}";
		m = xc.getnext();
	};
	cout << endl << endl << "Total count: " << xc.count() << endl << endl << endl;

	cout << "Permutation generator: " << endl << endl;

	char  CC[4][2] = { "A", "B", "C", "D" };
	cout << endl << "Исходное множество: ";
	cout << "{ ";
	for (int i = 0; i < sizeof(CC) / 2; i++)
		cout << CC[i] << ((i < sizeof(CC) / 2 - 1) ? ", " : " ");
	cout << "}";
	cout << endl << "Генерация перестановок ";
	combi3::permutation p(sizeof(CC) / 2);
	__int64 result = p.getfirst();
	while (n >= 0)
	{
		cout << endl << setw(4) << p.np << ": { ";
		for (int i = 0; i < p.n; i++)
			cout << CC[p.ntx(i)] << ((i < p.n - 1) ? ", " : " ");
		cout << "}";
		n = p.getnext();
	};
	cout << endl << "Total count: " << p.count() << endl;


	cout << "Placement generator:" << endl;

	cout << endl << "Placement generator from  " << N << " to " << M;
	combi4::accomodation s(N, M);
	int m = s.getfirst();
	while (m >= 0) {
		cout << endl << setw(2) << s.na << ": { ";
		for (int i = 0; i < 3; i++)
			cout << AA[s.ntx(i)] << ((i < n - 1) ? ", " : " ");
		cout << "}";
		m = s.getnext();
	};
	cout << endl << "Total count: " << s.count() << endl;

	system("pause");
	return 0;
}

