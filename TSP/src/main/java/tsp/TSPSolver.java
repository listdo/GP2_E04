package tsp;

import java.util.*;

public class TSPSolver {
    public static Random random = new Random();

    public static boolean measureRuntime = true;
    public static boolean randomSelection = false;
    public static boolean cyclicCrossover = false;
    public static boolean maximalPreservativeCrossover = false;

    public static void main(String[] args) {
        try {
            Problem problem;
            GA ga;
            Solution best;

            problem = new TSP("instances/ch130.tsp", 6110);
            ga = new GA(problem, 1000, 100, 0.05);
            best = ga.execute();
            System.out.println(best);

            System.out.println();
            System.out.println();

            problem = new TSP("instances/kroA200.tsp", 29368);
            ga = new GA(problem, 1000, 100, 0.05);
            best = ga.execute();
            System.out.println(best);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}