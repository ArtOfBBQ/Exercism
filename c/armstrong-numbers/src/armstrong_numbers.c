#include "math.h"
#include "armstrong_numbers.h"

// example: num_of_digits(221) yields 3
int num_of_digits(int num) 
{
    int num_digits = 1;

    while ( num / pow(10, num_digits) >= 1 )
    {
        num_digits = num_digits + 1;
    }

    return num_digits;
}

// example: get_digit_right(12345, 1) yields 5
int get_digit_right(int num, int index)
{
    return num % (int)pow(10, index) / pow(10, index - 1);
}

int is_armstrong_number(int candidate)
{
    int num_digits = num_of_digits(candidate);

    if (num_digits < 2) { return 1; }

    int sum_of_powers = 0;

    for (int i = 1; i <= num_digits; i++) {

        sum_of_powers += pow(get_digit_right(candidate, i), num_digits);
    }
    
    return sum_of_powers == candidate;
}
