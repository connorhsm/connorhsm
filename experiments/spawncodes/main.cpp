#include <random>
#include <string>
#include <iostream>
#include <functional>
#include <cstdint>

int main() {
    uint64_t seedHash = 0;
    int seedSpawnBoundingBox = 40000;

    std::seed_seq ssq { seedHash };
    std::mt19937_64 mt { ssq };
    std::uniform_int_distribution<int> dist(-seedSpawnBoundingBox / 2, seedSpawnBoundingBox / 2);

    int startX = dist(mt);
    int startY = dist(mt);

    std::cout << "startX: " << startX << ", startY: " << startY << std::endl;
    return 0;
}
