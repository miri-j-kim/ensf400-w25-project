package com.coveros.training;

public class Fibonacci {

    private Fibonacci() {
        // static utility class.  Do not construct.
    }

    public static long calculate(long n) {
        long result = 0;

        if (n <= 1) {
            result = n;
        } else {
            result = calculate(n - 1) + calculate(n - 2);
        }

        return result;
    }
}

