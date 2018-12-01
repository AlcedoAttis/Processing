PrintWriter output;

void setup() {
  ArrayList<Integer> list = new ArrayList<Integer>();
  ArrayList<Integer> list2 = new ArrayList<Integer>();

  System.out.println("Cferdsch");

  for (int i=123456789; i<=987654321; i++) {
    boolean[] ziffer = new boolean[9];
    int num = i;
    int num2 = 0;
    for (int j=0; j<9; j++) {
      num2 = num%10;
      num = (num - num2)/10;
      if (num2 != 0) ziffer[num2-1] = true;
    }
    boolean geht = true;
    for (boolean k : ziffer) {
      if (k==false) geht = false;
    }

    //if(geht==true) System.out.println("ja");
    //else System.out.println("nö");

    if (geht == true) {
      list.add(i);
    }
  }

  System.out.println("Bferdsch");

  for (int i=0; i<list.size(); i++) { // 
    System.out.println(i);
    int[] ziff = new int[9];
    int num = list.get(i);
    int num2 = 0;
    for (int k=0; k<9; k++) {
      num2 = num%10;
      num = (num - num2)/10;
      ziff[k] = num2;
    }
    //int[] ziff2 = reverse(ziff);
    int num3 = 0;
    for (int k=0; k<9; k++) {
      //System.out.println(num3);
      num3 = num3 * 10;
      num3 = num3 + ziff[k];
    }
    //System.out.println(num3);
    //System.out.println(list.get(i));
    list2.add(list.indexOf(num3));
  }

  System.out.println("Aferdsch");
  output = createWriter("in2.txt");

  for (int i=0; i<list2.size(); i++) {
    if(i % 2835 == 0) output.flush();
    output.println(list2.get(i));
  }
  output.flush();

  System.out.println("ferdsch");
  System.out.println(list2.get(list2.size()-2));
}