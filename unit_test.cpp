#include <iostream>
#include <cassert>
#include <chrono>
#include "calc.h"

void test_calculation_time() {
    Calculator calc;
    int n = 1000;  
    double x = 2.0; 

    auto start = std::chrono::high_resolution_clock::now();

    std::vector<double> values;
    for (int i = 0; i < n; ++i) {
        values.push_back(calc.FuncA(i + 1, x));  
    }

    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = end - start;

    assert(elapsed.count() >= 5 && elapsed.count() <= 20);

    std::cout << "Test passed! Calculation took " << elapsed.count() << " seconds." << std::endl;
}

int main() {
    test_calculation_time();
    return 0;
}

