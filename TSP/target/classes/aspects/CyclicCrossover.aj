package aspects;

import tsp.*;

public privileged aspect CyclicCrossover {
  Solution around(Solution solution, Solution other) :
    if (TSPSolver.cyclicCrossover) &&
    Pointcuts.cross(solution, other) {
    PathSolution child = new PathSolution(((PathSolution)solution).tsp);
    int[] tourA, tourB, newTour;
    int length, index, city;
    boolean[] indexCopied;

    tourA = ((PathSolution)solution).tour;
    tourB = ((PathSolution)other).tour;
    newTour = child.tour;

    length = tourA.length;
    indexCopied = new boolean[length];

    // copy whole cycle to new tour
    index = TSPSolver.random.nextInt(length);
    while (! indexCopied[index]) {
      newTour[index] = tourA[index];
      city = tourB[index];
      indexCopied[index] = true;

      // search copied city in second tour
      index = 0;
      while ((index < length) && (tourA[index] != city))
        index++;
    }

    // copy rest of second route to new route
    for (int i = 0; i < length; i++) {
      if (!indexCopied[i]) {
        newTour[i] = tourB[i];
      }
    }
    return child;
  }
}
