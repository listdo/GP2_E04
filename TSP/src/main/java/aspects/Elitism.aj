package aspects;

import tsp.*;

import java.util.Arrays;

public aspect Elitism {

    public Solution best;

    void around(Solution[] children): if(TSPSolver.elitism) && Pointcuts.replace(children) {
        Arrays.sort(children);
        // can't access parents therefore the children are the parents of the future

        if(best != null)
            children[children.length - 1] = best;

        best = children[0];

        proceed(children);
    }
}
