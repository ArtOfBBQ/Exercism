#include "raindrops.h"

namespace raindrops {

    std::string convert(int inputnum) {

        std::string return_val = "";

        if (inputnum % 3 == 0) { return_val += "Pling"; }  

        if (inputnum % 5 == 0) { return_val += "Plang"; }
        
        if (inputnum % 7 == 0) { return_val += "Plong"; }

        if (return_val.empty()) { return_val = std::to_string(inputnum); }

        return return_val;
    };

}
