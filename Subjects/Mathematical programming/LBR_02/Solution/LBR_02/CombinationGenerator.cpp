#include "pch.h"
#include "CombinationGenerator.h"
namespace CombinationGenerator {
    Generator_C::Generator_C(short elementsOfTheOrSet, short elementsInCombinations) {
        this->elementsOfTheOrSet = elementsOfTheOrSet;
        this->elementsInCombinations = elementsInCombinations;
        this->arrOfIndOfTheCurComb = new short[elementsInCombinations + 2];
        this->reset();
    }
    void  Generator_C::reset()     // сбросить генератор, начать сначала 
    {
        this->combNum = 0;
        for (int i = 0; i < this->elementsInCombinations; i++) this->arrOfIndOfTheCurComb[i] = i;
        this->arrOfIndOfTheCurComb[elementsInCombinations] = this->elementsOfTheOrSet;
        this->arrOfIndOfTheCurComb[elementsInCombinations + 1] = 0;
    };
    short Generator_C::getfirst() {
        return (this->elementsOfTheOrSet >= this->elementsInCombinations) ? this->elementsInCombinations : -1;
    };
    short Generator_C::getnext()   // сформировать следующий массив индексов  
    {
        short rc = getfirst();
        if (rc > 0)
        {
            short j;
            for (j = 0; this->arrOfIndOfTheCurComb[j] + 1 == this->arrOfIndOfTheCurComb[j + 1]; ++j) this->arrOfIndOfTheCurComb[j] = j;
            if (j >= this->elementsInCombinations) rc = -1;
            else {
                this->arrOfIndOfTheCurComb[j]++;
                this->combNum++;
            };
        }
        return rc;
    };
    short Generator_C::ntx(short i) { 
        return this->arrOfIndOfTheCurComb[i];
    };
    unsigned __int64 fact(unsigned __int64 x) { 
        return(x == 0) ? 1 : (x * fact(x - 1)); 
    };
    unsigned __int64 Generator_C::count() const
    {
        return (this->elementsOfTheOrSet >= this->elementsInCombinations) ?
            fact(this->elementsOfTheOrSet) / (fact(this->elementsOfTheOrSet - this->elementsInCombinations) * fact(this->elementsInCombinations)) : 0;
    };
};
