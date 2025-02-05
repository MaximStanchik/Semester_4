#include "Rearrangement.h"
#include <algorithm>
using namespace std;
#define NINF ((short)0x8000)

namespace perestan {
    permutation::permutation(short n) {
        this->n = n;
        this->sset = new short[n];
        this->dart = new bool[n];
        this->reset();
    };
    void permutation::reset() { this->getfirst(); };
    int64_t permutation::getfirst() {
        this->np = 0;
        for (int i = 0; i < this->n; i++) {
            this->sset[i] = i;
            this->dart[i] = L;
        };
        return (this->n > 0) ? this->np : -1;
    };
    int64_t permutation::getnext() {
        int64_t rc = -1;
        short maxm = NINF, idx = -1;
        for (int i = 0; i < this->n; i++) {
            if (i > 0 && this->dart[i] == L && this->sset[i] > this->sset[i - 1] &&
                maxm < this->sset[i])
                maxm = this->sset[idx = i];
            if (i < (this->n - 1) && this->dart[i] == R &&
                this->sset[i] > this->sset[i + 1] && maxm < this->sset[i])
                maxm = this->sset[idx = i];
        };
        if (idx >= 0) {
            std::swap(this->sset[idx],
                this->sset[idx + (this->dart[idx] == L ? -1 : 1)]);
            std::swap(this->dart[idx],
                this->dart[idx + (this->dart[idx] == L ? -1 : 1)]);
            for (int i = 0; i < this->n; i++)
                if (this->sset[i] > maxm)
                    this->dart[i] = !this->dart[i];
            rc = ++this->np;
        }
        return rc;
    };
    short permutation::ntx(short i) { return this->sset[i]; };
    uint64_t fact(uint64_t x) { return (x == 0) ? 1 : (x * fact(x - 1)); };
    uint64_t permutation::count() const { return fact(this->n); };
} // namespace perestan
