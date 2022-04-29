package application;

public class BinomialCoefficient {
	public static Long Calculate(int n, int m) {
		if ((m == 0) || (m == n))
			return 1L;
		else
			return Calculate(n - 1, m - 1) + Calculate(n - 1, m);
	}
}
