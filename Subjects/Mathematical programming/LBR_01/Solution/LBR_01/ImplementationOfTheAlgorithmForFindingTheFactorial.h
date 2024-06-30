#pragma once
#include "pch.h"

namespace factorialCalculation {
	bool checkValueForFactorial(const string& userEnteredValue);
	int removeLastSymbolAndConvertToInt(string& userEnteredValue);
	unsigned long long calculateTheFactorial(int number);
}