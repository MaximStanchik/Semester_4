#pragma once
namespace GeneratorOfTheSetOfAllSubsets {
	class Generator_S {
	public:
		short numberOfElements_OrSet;
		short numberOfElements_CurSubset;
		short *indexArray_CurSubset;

		unsigned __int64 bitMask;

		Generator_S(short numberOfElements_OrSet = 1);
		short getFirst();
		short getNext();
		short getElementOfTheIndexArray(short i);
		unsigned __int64 numberOfSubsets();
		void reset();
	};
};