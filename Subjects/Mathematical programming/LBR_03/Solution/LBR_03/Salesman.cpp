#include "salesman.h"
#include "Rearrangement.h"
#include <iomanip>
#include <iostream>

#define INF 0x7fffffff // бесконечность

int sum(int x1, int x2) // суммирование с учетом бесконечности
{
    return (x1 == INF || x2 == INF) ? INF : (x1 + x2);
};

int* firstpath(int n) // формирование 1го маршрута 0,1,2,..., n-1, 0
{
    int* rc = new int[n + 1];
    rc[n] = 0;
    for (int i = 0; i < n; i++)
        rc[i] = i;
    return rc;
};

int* source(int n) // формирование исходного массива 1,2,..., n-1
{
    int* rc = new int[n - 1];
    for (int i = 1; i < n; i++)
        rc[i - 1] = i;
    return rc;
};

void copypath(int n, int* r1, const int* r2) // копировать маршрут
{
    for (int i = 0; i < n; i++)
        r1[i] = r2[i];
};

int distance(int n, int* r, const int* d) // длина маршрута
{
    int rc = 0;
    for (int i = 0; i < n - 1; i++)
        rc = sum(rc, d[r[i] * n + r[i + 1]]);
    return sum(rc, d[r[n - 1] * n + 0]); //+ последн€€ дуга (n-1,0)
};

void indx(int n, int* r, const int* s, const short* ntx) {
    for (int i = 1; i < n; i++)
        r[i] = s[ntx[i - 1]];
}

int salesman(int n,     // [in]  количество городов
    Matrix* d, // [in]  массив [n*n] рассто€ний
    int* r     // [out] массив [n] маршрут 0 x x x x
) {
    int* s = source(n), * b = firstpath(n), rc = INF, dist = 0;
    perestan::permutation p(n - 1);
    int k = p.getfirst();
    while (k >= 0) // цикл генерации перестановок
    {
        indx(n, b, s, p.sset); // новый маршрут
        if ((dist = d->distance(b)) < rc) {
            if (dist > 0) {
                rc = dist;
                copypath(n, r, b);
            }
        }
        k = p.getnext();
    };
    return rc;
}

Matrix::Matrix(int N) : N(N) {
    matrix = new int* [N];
    for (int i{}; i < N; i++) {
        matrix[i] = new int[N];
    }
    generate();
    INF_pathes();
}

Matrix::Matrix(int matr[][5], int n) : N(n) {
    matrix = new int* [N];
    for (int i{}; i < N; i++) {
        matrix[i] = new int[N];
        for (int j{}; j < N; j++) {
            matrix[i][j] = matr[i][j];
        }
    }
}

Matrix::~Matrix() {
    for (int i{}; i < N; i++) {
        delete[] matrix[i];
    }
    delete[] matrix;
}

void Matrix::generate() {
    srand(time(NULL));
    for (int i = 0; i < N; i++) {
        for (int j = i; j < N; j++) {
            matrix[i][j] = rand() % 290 + 10;
            matrix[j][i] = matrix[i][j];
        }
    }
    for (int i = 0; i < N; i++) {
        matrix[i][i] = INF;
    }
}

void Matrix::INF_pathes() {
    srand(time(NULL));
    short inf = 3;
    while (inf > 0) {
        int x = rand() % N;
        int y = rand() % N;
        if (x != y && matrix[x][y] != INF) {
            matrix[x][y] = INF;
            matrix[y][x] = INF;
            inf--;
        }
    }
}

void Matrix::print() {
    for (int i{}; i < N; i++)
        if (i < 10)
            std::cout << std::setw(3) << i + 1 << " ";
        else
            std::cout << std::setw(3) << i + 1;
    std::cout << std::endl;
    for (int i{}; i < N; i++) {
        for (int j{}; j < N; j++)
            if (matrix[i][j] != INF) {
                std::cout << std::setw(3) << matrix[i][j] << " ";
            }
            else
                std::cout << std::setw(3) << "INF ";
        std::cout << " \\ " << i + 1 << std::endl;
    }
}

int Matrix::distance(int* path) {
    int res = 0;
    for (int i = 0; i < N - 1; i++) {
        if (matrix[path[i]][path[i + 1]] == INF)
            return INF;
        res += matrix[path[i]][path[i + 1]];
    }
    res += matrix[path[N - 1]][path[0]];
    return res;
}
