package aspects;

import tsp.*;

public aspect Pointcuts {
  public pointcut execute() :
          call(Solution Algorithm.execute());

  public pointcut select(GA ga, int parents) :
    call(Solution[] GA.select(..)) &&
    target(ga) &&
    args(parents);

  public pointcut iterate() :
          call(void GA.iterate());

  public pointcut isTerminated():
          call(boolean isTerminated());

  public pointcut replace(Solution[] children) :
          call(void GA.replace())
          && args(children);

  public pointcut createChildren():
          call(Solution[] GA.createChildren());

  public pointcut cross(Solution solution, Solution other) :
    call(Solution Solution.cross(..)) &&
    target(solution) &&
    args(other);
}