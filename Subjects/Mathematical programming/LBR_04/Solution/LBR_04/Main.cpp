#include "pch.h"
#include "Levenshtein.h"
#include "MultyMatrix.h"

#define N 6

const char* generateRandomString(int stringLength) {
    static const char latinAlphabet[26][2] = {
        {'a', 'A'},
        {'b', 'B'},
        {'c', 'C'},
        {'d', 'D'},
        {'e', 'E'},
        {'f', 'F'},
        {'g', 'G'},
        {'h', 'H'},
        {'i', 'I'},
        {'j', 'J'},
        {'k', 'K'},
        {'l', 'L'},
        {'m', 'M'},
        {'n', 'N'},
        {'o', 'O'},
        {'p', 'P'},
        {'q', 'Q'},
        {'r', 'R'},
        {'s', 'S'},
        {'t', 'T'},
        {'u', 'U'},
        {'v', 'V'},
        {'w', 'W'},
        {'x', 'X'},
        {'y', 'Y'},
        {'z', 'Z'}
    };

    char* result = new char[stringLength + 1];
    int randomStringInAlphabet{};
    int randomRowInAlphabet{};

    for (int i{}; i < stringLength; i++) {
        randomStringInAlphabet = rand() % 26;
        randomRowInAlphabet = rand() % 2;
        result[i] = latinAlphabet[randomStringInAlphabet][randomRowInAlphabet];
    }

    result[stringLength] = '\0'; 

    return result;
}


int main() {
    int userInput{};
    cout << "Select the task to complete:" << endl << endl;
    cout << "1 -- First and second tasks" << endl;
    cout << "2 -- Third task" << endl;
    cout << "0 -- Exit" << endl;
    cin >> userInput;
    switch (userInput) {
    case 1: {
        cout << "Completing the first task:" << endl << endl;

        int S1Length = 200;
        int S2Length = 300;

        const char* S1 = generateRandomString(S1Length);
        const char* S2 = generateRandomString(S2Length);

        cout << "String S1: " << S1 << endl << endl;
        cout << "String S2: " << S2 << endl;

        cout << endl;
        cout << "Completing the second task:" << endl << endl;

        int S1_size[]{ S1Length / 25, S1Length / 20, S1Length / 15, S1Length / 10, S1Length / 5, S1Length / 2, S1Length };
        int S2_size[]{ S2Length / 25, S2Length / 20, S2Length / 15, S2Length / 10, S2Length / 5, S2Length / 2, S2Length };

        clock_t t1{}, t2{}, t3{}, t4{};

        for (int i = 0; i < min(S1Length, S2Length); i++)
        {
            t1 = clock();
            levenshtein_r(S1_size[i], S1, S2_size[i], S2);
            t2 = clock();

            t3 = clock();
            levenshtein(S1_size[i], S1, S2_size[i], S2);
            t4 = clock();

            cout << "Length: " << S1_size[i] << "/" << S2_size[i] << endl;
            cout << "Execution time of the recursive function: " << (t2 - t1) << endl;
            cout << "Execution time of a function using dynamic programming: " << (t4 - t3) << endl << endl;
        }
        break;
    }
    case 2: {
        cout << "Completing the third task:" << endl;

        int Mc[N + 1] = { 10, 15, 80, 23, 50, 40, 71}, Ms[N][N], r = 0, rd = 0;

        memset(Ms, 0, sizeof(int) * N * N);
        r = OptimalM(1, N, N, Mc, OPTIMALM_PARM(Ms));
        setlocale(LC_ALL, "rus");
        cout << endl;
        cout << endl << "-- расстановка скобок (рекурсивное решение) "
            << endl;
        cout << endl << "размерности матриц: ";
        for (int i = 1; i <= N; i++)cout << "(" << Mc[i - 1] << "," << Mc[i] << ") ";
        cout << endl << "минимальное количество операций умножения: " << r;
        cout << endl << endl << "матрица S" << endl;
        for (int i = 0; i < N; i++)
        {
            cout << endl;
            for (int j = 0; j < N; j++) cout << Ms[i][j] << "  ";
        }
        cout << endl;

        memset(Ms, 0, sizeof(int) * N * N);
        rd = OptimalMD(N, Mc, OPTIMALM_PARM(Ms));
        cout << endl
            << "-- расстановка скобок (динамическое программирование) " << endl;
        cout << endl << "размерности матриц: ";
        for (int i = 1; i <= N; i++)
            cout << "(" << Mc[i - 1] << "," << Mc[i] << ") ";
        cout << endl << "минимальное количество операций умножения: "
            << rd;
        cout << endl << endl << "матрица S" << endl;
        for (int i = 0; i < N; i++)
        {
            cout << endl;
            for (int j = 0; j < N; j++)  cout << Ms[i][j] << "  ";
        }
        cout << endl << endl;
        break;
    }
    default: {
        break;
    }
    }
    system("pause");
	return 0;
}