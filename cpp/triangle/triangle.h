#if !defined(TRIANGLE_H)
#define TRIANGLE_H

namespace triangle {

   enum flavor { isosceles, scalene, equilateral };
   
   flavor kind(float side1, float side2, float side3);

}

#endif // TRIANGLE_H
