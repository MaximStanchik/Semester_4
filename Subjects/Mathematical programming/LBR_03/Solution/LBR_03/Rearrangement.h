#pragma once

#include <cstdint>
namespace perestan
{
    struct  permutation
    {
        const static bool L = true;
        const static bool R = false;

        short n,
            * sset;
        bool* dart;
        permutation(short n);

        void reset();

        int64_t getfirst();
        int64_t getnext();

        short ntx(short i);
        uint64_t np;

        uint64_t count() const;
    };
};
