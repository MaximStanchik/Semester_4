#include "pch.h"

namespace factorialCalculation {
    bool checkValueForFactorial(const string& userEnteredValue) {
        if (userEnteredValue.empty()) {
            return false;
        }

        for (size_t i = 0; i < userEnteredValue.length() - 1; i++) {
            if (!isdigit(userEnteredValue[i])) {
                return false;
            }
        }

        char lastSymbol = userEnteredValue[userEnteredValue.length() - 1];

        if (lastSymbol != '!') {
            return false;
        }
    }

    int removeLastSymbolAndConvertToInt(string& userEnteredValue) {

        char lastSymbol = userEnteredValue.back();
        userEnteredValue.pop_back();

        int intResult = 0;
        try {
            intResult = stoi(userEnteredValue);
        }
        catch (const exception& e) {
            return 0;
        }

        return intResult;
    }

    unsigned long long calculateTheFactorial(int number) {

        if (number == 0 || number == 1) {
            return 1;
        }
        else {
            return number * calculateTheFactorial(number - 1);
        }
    }
}
