#include "uptune.h"

namespace uptune {

// dispatch funtion
template<class T>
T tune (T origin, T* scope,
        consti char* name = ) {
    // return original value
    if (!std::getenv("EZTUNING")) {
      return origin;
    }
    // save scope and create objs
    else if (std::getenv("ANALYSIS")) {

    }
}

} // namespace uptune
