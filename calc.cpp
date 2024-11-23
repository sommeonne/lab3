#include "calc.h"
#include <cmath>

// Function to calculate factorial of a number
double factorial(int num) {
    if (num == 0 || num == 1) return 1;
    double fact = 1;
    for (int i = 2; i <= num; ++i) {
        fact *= i;
    }
    return fact;
}

double Calculator::FuncA(int n, double x) {
    // Calculate the sum of the first n elements of the series
    // n: Number of terms to sum
    // x: The variable in the series
    double sum = 0;
    for (int i = 0; i < n; ++i) {
        double term = std::pow(-1, i) * factorial(2 * i) / (std::pow(4, i) * std::pow(factorial(i), 2)) * std::pow(x, i);
        sum += term;
    }
    return sum;
}
