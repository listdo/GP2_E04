package aspects;

import application.BinomialCoefficient;
import application.Caching;

import java.util.Hashtable;

public aspect BinomialCache {
    public record Pair(int n, int m) { }

    private final Hashtable<Pair, Long> cache = new Hashtable<>();

    pointcut bcCall(int n, int m):
            if (Caching.cachingEnabled)
            && call(Long BinomialCoefficient.calculate(int, int))
            && args(n, m);

    Long around(int n, int m) : bcCall(n, m) {
        Pair key = new Pair(n, m);
        if (cache.containsKey(key)) {
            return cache.get(key);
        }

        Long value = proceed(n, m);
        cache.put(key, value);
        return value;
    }
}
