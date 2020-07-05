#include <math.h>

#include "grains.h"

namespace grains {

    unsigned long square(unsigned short square) {

        if (square == 1) { return 1; }

        return pow(2, square - 1);
    };

    unsigned long total() {

        unsigned long return_value = 0;

        for (int cur_square = 1; cur_square <= 64; cur_square++) {

            return_value += square(cur_square);

        }

        return return_value;

    };

}
