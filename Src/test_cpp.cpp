#include "test_cpp.h"
#include <vector>
#include <numeric>

int test_cpp_sum()
{
    std::vector<int> nums = {1, 2, 3, 4, 5};

    int sum = std::accumulate(nums.begin(), nums.end(), 0);

    return sum;
}