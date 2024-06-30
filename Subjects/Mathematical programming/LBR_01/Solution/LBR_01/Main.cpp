#include "pch.h"
#include "ImplementationOfTheAlgorithmForFindingTheFactorial.h"

#define CYCLE 1'000'000                       

int _tmain(int argc, _TCHAR* argv[])
{
	setlocale(LC_ALL, "Rus");

	cout << "Реализация примера из лабораторной работы:" << endl << endl;

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

	cout << "Кол-во циклов: " << CYCLE << endl;
	cout << "Ср. значение (int): " << av1 / CYCLE << endl;
	cout << "Ср. значение (double): " << av2 / CYCLE << endl;
	cout << "Продолжительность (у.е): " << (t2 - t1) << endl;
	cout << "                  (сек):   " << ((double)(t2 - t1)) / ((double)CLOCKS_PER_SEC) << endl << endl;

	cout << "Реализация рекурсивного алгоритма 'Вычисление факториала':" << endl << endl;

	int factorial{};
	string userEnteredValue{};
	clock_t startOfCountdown{};
	clock_t endOfCountdown{};

userInput:
	cout << "Введите факториал, который Вы хотите решить: ";
	cin >> userEnteredValue;

	if (factorialCalculation::checkValueForFactorial(userEnteredValue)) {
		startOfCountdown = clock();
		factorial = factorialCalculation::removeLastSymbolAndConvertToInt(userEnteredValue);
		cout << "Вычисленный факториал: " << factorialCalculation::calculateTheFactorial(factorial) << endl;
		endOfCountdown = clock();
		cout << "Кол-во итераций: " << factorial << endl;
		cout << "Продолжительность (у.е): " << (endOfCountdown - startOfCountdown) << endl;
		cout << "                  (сек):   " << ((double)(endOfCountdown - startOfCountdown)) / ((double)CLOCKS_PER_SEC) << endl << endl;
	}
	else {
		cout << "Введено некорректное значение." << endl;
		goto userInput;
	}

	system("pause");
	return 0;
}