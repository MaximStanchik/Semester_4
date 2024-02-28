#include "pch.h"
#include "GeneratorOfTheSetOfAllSubsets.h"

namespace GeneratorOfTheSetOfAllSubsets {
	Generator_S::Generator_S(short numberOfElements_OrSet) {
		this->numberOfElements_OrSet = numberOfElements_OrSet;
		this->indexArray_CurSubset = new short[numberOfElements_OrSet];
		this->reset();
	}
	short Generator_S::getFirst() {
		__int64 buf = this->bitMask;
		this->numberOfElements_CurSubset = 0;
		for (short i = 0; i < numberOfElements_OrSet; i++) {
			if (buf & 0x1) this->indexArray_CurSubset[this->numberOfElements_CurSubset++] = i;
			buf >>= 1;
		}
		return this->numberOfElements_CurSubset;

	}
	short Generator_S::getNext() {
		int rc = -1;
		this->numberOfElements_CurSubset = 0;
		if (++this->bitMask < this->numberOfSubsets()) rc = getFirst();
		return rc;

	}
	unsigned __int64 Generator_S::numberOfSubsets() {
		return (unsigned __int64)(1 << this->numberOfElements_OrSet);
	}
	short Generator_S::getElementOfTheIndexArray(short i) {
		return  this->indexArray_CurSubset[i];
	}
	void Generator_S::reset() {
		this->numberOfElements_CurSubset = 0;
		this->bitMask = 0;

	}
}