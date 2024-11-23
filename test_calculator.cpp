#include <gtest/gtest.h>
#include "calc.h"

class CalculatorTest : public ::testing::Test {
protected:
    Calculator calc;
};

TEST_F(CalculatorTest, FuncA_CorrectResults) {
    // Тест 1: Очікуваний результат для n=5, x=1
    double result = calc.FuncA(5, 1.0);
    EXPECT_NEAR(result, 1.0, 1e-5);  // Можна змінити очікуваний результат залежно від обчислення серії

    // Тест 2: Очікуваний результат для n=3, x=2
    result = calc.FuncA(3, 2.0);
    EXPECT_NEAR(result, 2.66666666667, 1e-5);

    // Тест 3: Крайній випадок для n=0
    result = calc.FuncA(0, 1.0);
    EXPECT_EQ(result, 0.0);
}
