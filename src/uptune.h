#ifndef UPTUNE_H_
#define UPTUNE_H_

#include <string>
#include <unordered_map>
#include <vector>

// example usage:
// int a = uptune::tune<int>(1, std::make_tuple());
// string b = uptune::tune<string>("auto", {"auto", "off"});
// float c = uptune::tune<float>(0.5, );
namespace uptune {

template<typename T>
class tuneBase {
  public:
    tuneBase(const std::string& name = "") 
      : name{name}, tail{0}, head{0} {
      if (name == "") name = GetUniqueName();
    }
    // disable copy (assignment) constructor
    tuneBase(const stream&) = delete;
    tuneBase(stream&&) = default;
    tuneBase& operator=(const stream&) = delete;
    tuneBase& operator=(stream&&) = default;
    
    // get tune instance information
    virtual const char* get_name() const = 0;
    virtual T* get_space() const = 0;

  private:
    const std::string name;
    // save all tuning vars info
    static std::vector 
}

} // namespace uptune
