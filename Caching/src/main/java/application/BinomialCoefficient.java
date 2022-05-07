package application;

public class BinomialCoefficient {
	public static Long calculate(int n, int m) {
		if ((m == 0) || (m == n))
			return 1L;
		else
			return calculate(n - 1, m - 1) + calculate(n - 1, m);
	}
}
