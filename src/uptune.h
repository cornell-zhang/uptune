#ifndef _UPTUNE_H_
#define _UPTUNE_H_

#include <string>
#include <unordered_map>
#include <vector>
#include "logger.h"

// Example usage:
// int a    = uptune::tune<int>(1, {1, 3});
// string b = uptune::tune<string>("auto", {"auto", "off"});
// float c  = uptune::tune<float>(0.5, {});

namespace uptune {

const char* GetUnique();

template<typename T>
T tune(T origin, std::vector<T> space, const std::string name="") {
    // return original value
    if (!std::getenv("EZTUNING")) {
      return origin;
    }

    // save scope and create objs
    else if (std::getenv("ANALYSIS")) {
      for (auto& v : space) {
      }
    }
    return origin;
}

template<typename T>
class tuneBase {
  public:
    tuneBase() {}

    // get tune instance information
    virtual const char* get_name() const = 0;
    virtual T* get_space() const = 0;

  private:
    const char* name;
};


} // namespace uptune
#endif
