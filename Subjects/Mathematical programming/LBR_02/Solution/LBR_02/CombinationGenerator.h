#pragma once
namespace CombinationGenerator {
    class Generator_C {
    public:
        short  elementsOfTheOrSet,        // ���������� ��������� ��������� ���������  
            elementsInCombinations,           // ���������� ��������� � ���������� 
            * arrOfIndOfTheCurComb;      // ������ �������� �������� ���������  
        Generator_C(
            short elementsOfTheOrSet = 1, //���������� ��������� ��������� ���������  
            short m = 1  // ���������� ��������� � ����������
        );
        void reset();              // �������� ���������, ������ ������� 
        short getfirst();          // ������������ ������ ������ ��������    
        short getnext();           // ������������ ��������� ������ ��������  
        short ntx(short i);        // �������� i-� ������� ������� ��������  
        unsigned __int64 combNum;       // ����� ���������  0,..., count()-1   
        unsigned __int64 count() const;  // ��������� ���������� ���������      
    };
};
    

