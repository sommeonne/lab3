#include <iostream>
#include "calc.h"

int main() {
    Calculator calc;
    int n;
    double x;
    std::cout << "Enter the number of elements to sum: ";
    std::cin >> n;
    std::cout << "Enter the value of x: ";
    std::cin >> x;
    
    double result = calc.FuncA(n, x);
    std::cout << "Result of FuncA for n = " << n << " and x = " << x << ": " << result << std::endl;
    return 0;
}
