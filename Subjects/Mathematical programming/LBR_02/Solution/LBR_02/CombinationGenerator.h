#pragma once
namespace CombinationGenerator {
    class Generator_C {
    public:
        short  elementsOfTheOrSet,        // количество элементов исходного множества  
            elementsInCombinations,           // количество элементов в сочетаниях 
            * arrOfIndOfTheCurComb;      // массив индексов текущего сочетания  
        Generator_C(
            short elementsOfTheOrSet = 1, //количество элементов исходного множества  
            short m = 1  // количество элементов в сочетаниях
        );
        void reset();              // сбросить генератор, начать сначала 
        short getfirst();          // сформировать первый массив индексов    
        short getnext();           // сформировать следующий массив индексов  
        short ntx(short i);        // получить i-й элемент массива индексов  
        unsigned __int64 combNum;       // номер сочетания  0,..., count()-1   
        unsigned __int64 count() const;  // вычислить количество сочетаний      
    };
};
    

