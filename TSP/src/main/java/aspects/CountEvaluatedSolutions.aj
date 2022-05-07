package aspects;

import tsp.Solution;
import java.util.*;
import tsp.*;
import java.util.Date;

public aspect CountEvaluatedSolutions {

    declare precedence: LimitEvaluatedSolutions, CountEvaluatedSolutions;

    public static int countSolutions = 0;

    before() : if(TSPSolver.countSolutions) &&
            Pointcuts.iterate() {
        countSolutions++;
    }

    before() : if(TSPSolver.countSolutions) &&
            Pointcuts.execute() {
        countSolutions = 0;
    }

    after() : if(TSPSolver.countSolutions) &&
            Pointcuts.execute() {
        System.out.println("Solutions:\t" + countSolutions);
    }
}
