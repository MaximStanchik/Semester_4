#include "pch.h"
#include "BoatC.h"

#define NN 8
#define MM 4


int _tmain(int argc, _TCHAR* argv[]) {
    setlocale(LC_ALL, "Rus");

    cout << "---------- Tasks 5 ----------" << endl;

    clock_t startOfCountdown{};
    clock_t endOfCountdown{};

    startOfCountdown = clock();

    int v[] = { 180, 150, 120, 160, 140, 130, 170, 190 }; // ���
    int c[] = { 60,  80,  90,  70,  100,  110,  75,  85 };     // ����� 
    int minv[] = { 70, 80, 90, 100, 110 };      // �����������  ��� 
    int maxv[] = { 200, 300, 400, 500, 600 };    // ������������ ���

    short r[MM];
    int cc = boat_�(
        MM,    // [in]  ���������� ���� ��� �����������
        minv,  // [in]  ������������ ��� ���������� �� ������  ����� 
        maxv,  // [in]  ����������� ��� ���������� �� ������  �����  
        NN,    // [in]  ����� �����������  
        v,     // [in]  ��� ������� ����������  
        c,     // [in]  ����� �� ��������� ������� ����������   
        r      // [out] ������  ��������� �����������  
    );
    cout << endl << "- ������ � ���������� ����������� �� ����� -";
    cout << endl << "- ����� ���������� �����������   : " << NN;
    cout << endl << "- ���������� ���� ��� �����������  : " << MM;
    cout << endl << "- �����������  ��� ����������  : ";

    for (int i = 0; i < MM; i++) cout << setw(3) << minv[i] << " ";
    cout << endl << "- ������������ ��� ����������  : ";

    for (int i = 0; i < MM; i++) cout << setw(3) << maxv[i] << " ";
    cout << endl << "- ��� �����������        : ";

    for (int i = 0; i < NN; i++) cout << setw(3) << v[i] << " ";
    cout << endl << "- ����� �� ���������     : ";

    for (int i = 0; i < NN; i++) cout << setw(3) << c[i] << " ";
    cout << endl << "- ������� ���������� (0,1,...,m-1) : ";

    for (int i = 0; i < MM; i++) std::cout << r[i] << " ";
    cout << endl << "- ����� �� ���������     : " << cc;

    cout << endl << "- ��� ������� ���������� ����������: ";
    for (int i = 0; i < MM; i++) {
        cout << setw(3) << v[r[i]] << " ";
    }

    cout << endl << "- ����� �� ��������� ������� ���������� ����������: ";
    for (int i = 0; i < MM; i++) {
        cout << setw(3) << c[r[i]] << " ";
    }

    endOfCountdown = clock();

    cout << endl;

    cout << "����������������� (�.�): " << (endOfCountdown - startOfCountdown) << endl;
    cout << "                  (���):   " << ((double)(endOfCountdown - startOfCountdown)) / ((double)CLOCKS_PER_SEC) << endl << endl;

    cout << endl << endl;

    system("pause");
    return 0;
}