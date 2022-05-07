package aspects;

import tsp.*;

public aspect LimitEvaluatedSolutions  {

    private static int count = 0;

    before() : if(TSPSolver.limitSolutions) &&
            Pointcuts.execute() {
        count = 0;
    }

    before() : if(TSPSolver.limitSolutions) &&
            Pointcuts.iterate() {
        count++;
    }

    boolean around(): if(TSPSolver.limitSolutions) && Pointcuts.isTerminated() {
        if(count >= 500)
            return true;

        return proceed();
    }
}
