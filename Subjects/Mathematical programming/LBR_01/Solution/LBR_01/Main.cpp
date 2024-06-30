#include "pch.h"
#include "ImplementationOfTheAlgorithmForFindingTheFactorial.h"

#define CYCLE 1'000'000                       

int _tmain(int argc, _TCHAR* argv[])
{
	setlocale(LC_ALL, "Rus");

	cout << "���������� ������� �� ������������ ������:" << endl << endl;

	double av1{};
	double av2{};
	clock_t t1{};
	clock_t t2{};

	auxil::start();
	t1 = clock();

	for (int i{}; i < CYCLE; i++) {
		av1 += auxil::iget(-100, 100);
		av2 += auxil::dget(-100, 100);
	}

	t2 = clock();

	cout << "���-�� ������: " << CYCLE << endl;
	cout << "��. �������� (int): " << av1 / CYCLE << endl;
	cout << "��. �������� (double): " << av2 / CYCLE << endl;
	cout << "����������������� (�.�): " << (t2 - t1) << endl;
	cout << "                  (���):   " << ((double)(t2 - t1)) / ((double)CLOCKS_PER_SEC) << endl << endl;

	cout << "���������� ������������ ��������� '���������� ����������':" << endl << endl;

	int factorial{};
	string userEnteredValue{};
	clock_t startOfCountdown{};
	clock_t endOfCountdown{};

userInput:
	cout << "������� ���������, ������� �� ������ ������: ";
	cin >> userEnteredValue;

	if (factorialCalculation::checkValueForFactorial(userEnteredValue)) {
		startOfCountdown = clock();
		factorial = factorialCalculation::removeLastSymbolAndConvertToInt(userEnteredValue);
		cout << "����������� ���������: " << factorialCalculation::calculateTheFactorial(factorial) << endl;
		endOfCountdown = clock();
		cout << "���-�� ��������: " << factorial << endl;
		cout << "����������������� (�.�): " << (endOfCountdown - startOfCountdown) << endl;
		cout << "                  (���):   " << ((double)(endOfCountdown - startOfCountdown)) / ((double)CLOCKS_PER_SEC) << endl << endl;
	}
	else {
		cout << "������� ������������ ��������." << endl;
		goto userInput;
	}

	system("pause");
	return 0;
}