#include "uptune.h"

namespace uptune {

const char* GetUnique() {return "test";} 

template<> tuneBase<int>::tuneBase() {
    name = "var"; 
}

} // namespace uptune
