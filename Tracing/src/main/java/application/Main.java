package application;

public class Main {
  public static void main(String[] args) {
    PositiveValues values = new PositiveValues(10);
    
    try {
      values.addPositiveValue(1);
      values.addPositiveValue(-1);
    } catch (Exception e) { }
  }
}
