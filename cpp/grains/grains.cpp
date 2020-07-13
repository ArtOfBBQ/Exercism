#include <math.h>

#include "grains.h"

namespace grains {

    unsigned long long square(int square) {
    
        return exp2(square - 1);

    }

    unsigned long long total() {

        unsigned long long final_square = square(64);

        return final_square + final_square - 1;
    };

}
