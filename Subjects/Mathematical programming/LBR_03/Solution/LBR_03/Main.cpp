#include "salesman.h"
#include <iostream>
#include <ctime>

using namespace std;

int main(int argc, char* argv[]) {
    setlocale(LC_ALL, "Russian");
    int n = 5;
    int matrix[5][5] = { {INF, 16, 29, INF, 8},
                         {8, INF, 23, 60, 76},
                         {10, 24, INF, 86, 57},
                         {25, 50, 32, INF, 24},
                         {85, 74, 52, 21, INF} };
    for (int N = 5; N <= 5; N++) {

        clock_t start = clock();
        Matrix d(matrix, n);
        int* r = new int[N]; 
        int s = salesman(N, &d, r);
        cout << endl << "-- Задача коммивояжера -- ";
        cout << endl << "-- количество  городов: " << N;
        cout << endl << "-- матрица расстояний : " << endl;
        d.print();
        cout << endl << "-- оптимальный маршрут: ";
        for (int j = 0; j < N; j++)
            cout << r[j] + 1 << "->";
        cout << 1;
        cout << endl << "-- длина маршрута : " << s<< endl;
        clock_t end = clock();
        cout << "Время:" << end - start << endl;

        delete[] r; 
    }
    return 0;
}