#pragma once
#define INF 0x7fffffff // бесконечность
#include "Rearrangement.h"

class Matrix {
private:
    int N;

public:
    int** matrix;
    Matrix(int);
    Matrix(int[][5], int);
    ~Matrix();
    void print();
    void generate();
    void INF_pathes();
    int distance(int*);
};

int salesman( // функция возвращает длину оптимального маршрута
    int n,    // [in]  количество городов
    Matrix* d, // [in]  массив [n*n] расстояний
    int* r     // [out] массив [n] маршрут 0 x x x x
);
