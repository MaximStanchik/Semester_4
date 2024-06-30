#pragma once
#define INF 0x7fffffff // �������������
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

int salesman( // ������� ���������� ����� ������������ ��������
    int n,    // [in]  ���������� �������
    Matrix* d, // [in]  ������ [n*n] ����������
    int* r     // [out] ������ [n] ������� 0 x x x x
);
