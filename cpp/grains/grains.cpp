#include <math.h>

#include "grains.h"

namespace grains {

    unsigned long long square(int square) {
    
        // The bitwise "shift left" operator
        // *********************************
        //
        // this code gives the same result
        // as math.pow(2ULL, square - 1)
        //
        // let's write the number 1 as binary, e.g. 0001
        // 
        // this will become 0010
        // when it's "shifted left" 1x
        // 0010 is 2, 0100 is 4, 1000 is 8, etc.
        return 1ULL << (square - 1);
    }

    unsigned long long total() {

        unsigned long long final_square = square(64);

        return final_square + final_square - 1;
    };

}
