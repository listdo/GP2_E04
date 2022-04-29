package aspects;

import java.util.*;
import tsp.*;

public aspect MeasureRuntime {
  Solution around() : if(TSPSolver.measureRuntime) &&
                      Pointcuts.execute() {
    Solution best;

    Date start = new Date();
    best = proceed();
    Date end = new Date();

    System.out.println("Runtime (in ms): " + (end.getTime() - start.getTime()));
    return best;
  }
}