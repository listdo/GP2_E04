package aspects;

public aspect Tracing {
    pointcut methodCall():
            call(* application.*.*(..))
                    && !within(Tracing);

    before(): methodCall() {
        System.out.println("Entering " + thisJoinPointStaticPart.getSignature().getName());
    }

    after() returning: methodCall() {
        System.out.println("Exiting " + thisJoinPointStaticPart.getSignature().getName());
    }

    after() throwing(Throwable t) : methodCall() {
        System.out.println("Exiting " + thisJoinPointStaticPart.getSignature().getName()
        + " " + t.getMessage() + " (" + t.getClass().getName() + ")");
    }

    pointcut fieldAccess():
            get(* application.*.*) || set(* application.*.*);

    before(): fieldAccess() {
        System.out.println("Accessing " + thisJoinPointStaticPart.getSignature().getName());
    }

    after(): fieldAccess() {
        System.out.println("Accessed " + thisJoinPointStaticPart.getSignature().getName());
    }
}
