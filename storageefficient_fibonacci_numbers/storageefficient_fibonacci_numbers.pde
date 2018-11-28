int[] storage = new int[2];
int index = 0;

void setup() {
  frameRate(20);
  storage[0] = 0;
  storage[1] = 1;
}

void draw() {
  storage[index] = storage[0] + storage[1];
  System.out.println("[ "+storage[0]+" , "+storage[1]+" ]");
  index = 1-abs(index);
}