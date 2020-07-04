#include <stdexcept>
#include "triangle.h"

namespace triangle {

    flavor kind(float side1, float side2, float side3) {

        if (side1 <= 0 || side2 <= 0 || side3 <= 0) {
            throw std::domain_error("Each triangle side must be >= 0");
        }

        if (side1 + side2 < side3
            || side1 + side3 < side2
            || side2 + side3 < side1) {

            throw std::domain_error(
                "No side may be > sum of the remaining 2");

        }

        if (side1 == side2) {
            if (side1 == side3) {
                return flavor::equilateral;
            } else 
            {
                return flavor::isosceles;
            }
        } else {
            if (side1 == side3 || side2 == side3) {
                return flavor::isosceles;
            }
        }

        return flavor::scalene;
    };
}

