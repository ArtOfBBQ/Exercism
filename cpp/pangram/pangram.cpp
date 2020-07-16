#include "pangram.h"

namespace pangram {

    bool is_pangram(std::string input) {

        if (input.size() == 0) { return false; }

        // save each unseen letter in here,
        // then check if we have all 26 in the alphabet    
        std::unordered_set<char> alphabet = std::unordered_set<char>();
         
        for (unsigned long i = 0; i < input.size(); i++) {
            if (isalpha(input[i]) &&
                alphabet.find(tolower(input[i])) == alphabet.end()) {
                
                alphabet.insert(tolower(input[i]));
            }
        }
         
        return alphabet.size() == 26;
    }
}
