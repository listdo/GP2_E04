package application;

public class Caching {
    public static boolean loggingEnabled = true;
    public static boolean cachingEnabled = false;

    public static void test(int n, int m) {
        System.out.println("Caching Status: " + (cachingEnabled ? "active" : "inactive"));
        System.out.println("Calculating binomial coefficient for (" + n + "," + m + ")... ");
        long result = BinomialCoefficient.calculate(n, m);
        System.out.println("Finished. Result: " + result);
        System.out.println();
    }

    public static void main(String[] args) {
        System.out.println("Logging Status: " + (loggingEnabled ? "active" : "inactive"));
        System.out.println();

        test(10, 7);
        test(45, 6);

        cachingEnabled = true;

        test(45, 6);
        test(80, 60);

        System.out.println();
    }
}
