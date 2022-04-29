package application;

public class PositiveValues {
  private int[] positiveValues;
  private int last;
  
  private PositiveValues() { }
  public PositiveValues(int size) {
    positiveValues = new int[size];
    last = 0;
  }
  
  public int[] getPositiveValues() {
    return positiveValues;
  }
  
  public void setPositiveValue(int index, int value) throws IllegalArgumentException {
    if (value < 0)
      throw new IllegalArgumentException("ERROR: value is not positive");
    positiveValues[index] = value;
  }
  
  public void addPositiveValue(int value) throws IllegalArgumentException {
    setPositiveValue(last, value);
    last++;
  }
  
  public int elements() {
    return last;
  }
  
  public void clear() {
    last = 0;
  }
}
