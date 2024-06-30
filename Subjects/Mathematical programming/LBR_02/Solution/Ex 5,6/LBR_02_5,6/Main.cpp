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

    int v[] = { 180, 150, 120, 160, 140, 130, 170, 190 }; // вес
    int c[] = { 60,  80,  90,  70,  100,  110,  75,  85 };     // доход 
    int minv[] = { 70, 80, 90, 100, 110 };      // минимальный  вес 
    int maxv[] = { 200, 300, 400, 500, 600 };    // максимальный вес

    short r[MM];
    int cc = boat_с(
        MM,    // [in]  количество мест для контейнеров
        minv,  // [in]  максимальный вес контейнера на каждом  месте 
        maxv,  // [in]  минимальный вес контейнера на каждом  месте  
        NN,    // [in]  всего контейнеров  
        v,     // [in]  вес каждого контейнера  
        c,     // [in]  доход от перевозки каждого контейнера   
        r      // [out] номера  выбранных контейнеров  
    );
    cout << endl << "- Задача о размещении контейнеров на судне -";
    cout << endl << "- общее количество контейнеров   : " << NN;
    cout << endl << "- количество мест для контейнеров  : " << MM;
    cout << endl << "- минимальный  вес контейнера  : ";

    for (int i = 0; i < MM; i++) cout << setw(3) << minv[i] << " ";
    cout << endl << "- максимальный вес контейнера  : ";

    for (int i = 0; i < MM; i++) cout << setw(3) << maxv[i] << " ";
    cout << endl << "- вес контейнеров        : ";

    for (int i = 0; i < NN; i++) cout << setw(3) << v[i] << " ";
    cout << endl << "- доход от перевозки     : ";

    for (int i = 0; i < NN; i++) cout << setw(3) << c[i] << " ";
    cout << endl << "- выбраны контейнеры (0,1,...,m-1) : ";

    for (int i = 0; i < MM; i++) std::cout << r[i] << " ";
    cout << endl << "- доход от перевозки     : " << cc;

    cout << endl << "- Вес каждого выбранного контейнера: ";
    for (int i = 0; i < MM; i++) {
        cout << setw(3) << v[r[i]] << " ";
    }

    cout << endl << "- Доход от перевозки каждого выбранного контейнера: ";
    for (int i = 0; i < MM; i++) {
        cout << setw(3) << c[r[i]] << " ";
    }

    endOfCountdown = clock();

    cout << endl;

    cout << "Продолжительность (у.е): " << (endOfCountdown - startOfCountdown) << endl;
    cout << "                  (сек):   " << ((double)(endOfCountdown - startOfCountdown)) / ((double)CLOCKS_PER_SEC) << endl << endl;

    cout << endl << endl;

    system("pause");
    return 0;
}