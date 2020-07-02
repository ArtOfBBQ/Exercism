#include <string>
#include "reverse_string.h"

namespace reverse_string {

    std::string reverse_string(std::string input) 
    {
        if (input.length() < 1) { return ""; }

        std::string return_value;

        for (int i = input.length() - 1; i >= 0; i--)
        {
            return_value += input.at(i);
        }

        return return_value;
    }

}  // namespace reverse_string
