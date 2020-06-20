#include <gtest/gtest.h>

#include "uptune.h"

TEST(test, basic) {
    auto a = uptune::tune<int>(2, {1, 8});
    EXPECT_EQ(a, 2);
}
