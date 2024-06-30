#include "pch.h"
#include "Auxil.h"  

namespace auxil {
    void start()
    {
        srand(static_cast<unsigned>(time(nullptr)));
    };
    double dget(double rmin, double rmax) 
    {
        return ((double)rand() / (double)RAND_MAX) * (rmax - rmin) + rmin;
    };
    int iget(int rmin, int rmax)         
    {
        return (int)dget((double)rmin, (double)rmax);
    };
}
