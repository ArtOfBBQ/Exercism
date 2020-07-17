#include "pangram.h"

namespace pangram {

    bool is_pangram(const std::string& input) {

        if (input.size() == 0) { return false; }

        std::unordered_set<char> letters_seen;
         
        for (char current_char : input) {
            if (isalpha(current_char)) {
                letters_seen.insert(tolower(current_char));
            }
        }
         
        return letters_seen.size() == 26;
    }
}
