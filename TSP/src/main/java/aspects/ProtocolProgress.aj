package aspects;


import tsp.*;
import tsp.Solution;

import java.util.Arrays;

public aspect ProtocolProgress {
    // Add an aspect ProtocolProgress to TSPSolver that stores best, worst and average qualities of the
    // population and writes it to the console after the algorithm has finished.
    double best; double worst; double average;

    Solution[] around(): if(TSPSolver.progress) && Pointcuts.createChildren() {
        Solution[] solutions = proceed();

        Arrays.sort(solutions);

        best = solutions[0].getQuality();
        worst = solutions[solutions.length - 1].getQuality();

        for (var item: solutions) {
            average += item.getQuality();
        }

        average /= solutions.length;

        return solutions;
    }

    after() : if(TSPSolver.countSolutions) &&
            Pointcuts.execute() {
        System.out.println("Best:\t" + best);
        System.out.println("Worst:\t" + worst);
        System.out.println("Average:\t" + average);
    }
}
