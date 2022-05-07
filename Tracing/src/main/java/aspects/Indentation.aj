package aspects;

public aspect Indentation {
    declare precedence: Indentation, Tracing;

    private int indent = -1;

//    pointcut tracing():
//            call(* java.io.PrintStream.*(..))
//            && within(Tracing);

    pointcut tracing(java.io.PrintStream ps):
            target(ps)
            && within(Tracing);


    before() : Tracing.methodCall() || Tracing.fieldAccess() {
        ++indent;
    }

    after() : Tracing.methodCall() || Tracing.fieldAccess() {
        --indent;
    }

//    before() : tracing() {
//        for (int i = 0; i < indent; i++) {
//            System.out.print("  ");
//        }
//    }

    before(java.io.PrintStream ps) : tracing(ps) {
        for (int i = 0; i < indent; i++) {
            ps.print("  ");
        }
    }
}
