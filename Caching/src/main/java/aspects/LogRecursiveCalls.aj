package aspects;

import application.BinomialCoefficient;
import application.Caching;

public aspect LogRecursiveCalls {
    private int recursiveCalls;

    pointcut outerCall():
            if (Caching.loggingEnabled)
            && call(Long BinomialCoefficient.calculate(int, int))
            && !within(BinomialCoefficient);

    pointcut innerCall():
            if (Caching.loggingEnabled)
            && call(Long BinomialCoefficient.calculate(int, int))
            && withincode(Long BinomialCoefficient.calculate(int, int));

    before(): outerCall() {
        recursiveCalls = 0;
    }

    before(): innerCall() {
        ++recursiveCalls;
    }

    after(): outerCall() {
        System.out.println("[Recursive Calls: " + recursiveCalls + "]");
    }
}
