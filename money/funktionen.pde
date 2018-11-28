///////////////////////////////////////////////
boolean check(int x) {
  prim(x);
  //fib3(x);
  return rec_ranz(k,0,x);
}
///////////////////////////////////////////////

// 3 // 0.333
void triv(int x){
  if(x%k == 1) y.add(x);
}

// 2 // 0.5
// 3 // 0.333
void triv_no_intell(int x){
  if(!rec_ranz(k,0,x)) y.add(x);
}

// 2 // 0.333
// 3 // 0.2
// 4 // 0.144
void triv_with_2(int x){
  if(!rec_ranz(k,0,x)) y.add(x);
  if(!y.contains(2)) y.add(2);
}

// 2 // Error @ 12
// 3 // Error @ 33
// 4 // Error @ 88
// 5 // Error @ 232
void fib(int x){
  ArrayList<Integer> nums = new ArrayList<Integer>();
  nums.add(1); nums.add(1);
  if(x==1) y.add(1);
  while(true){
    int nuw = nums.get(nums.size()-1) + nums.get(nums.size()-2);
    if(nuw == x) y.add(x);
    if(nuw > x) break;
    nums.add(nuw);
  }
}

// 3 // 0.000
void prim(int x){
  if(x==1) y.add(1);
  boolean is_prime = true;
  for(int i=2; i<=sqrt(x); i++){
    if(x%i == 0) is_prime = false;
  }
  if(is_prime) y.add(x);
}

void fib2(int x){
  ArrayList<Integer> nums = new ArrayList<Integer>();
  nums.add(2); nums.add(1);
  if(x==1){ y.add(1); y.add(2);}
  while(true){
    int nuw = nums.get(nums.size()-1) + nums.get(nums.size()-2);
    if(nuw == x) y.add(x);
    if(nuw > x) break;
    nums.add(nuw);
  }
}

void fib3(int x){
  ArrayList<Integer> nums = new ArrayList<Integer>();
  nums.add(1); nums.add(1);
  if(x==1){ y.add(1);}
  while(true){
    int nuw = nums.get(nums.size()-1) + nums.get(nums.size()-2);
    if(nuw == x) y.add(x);
    if(nuw > x) break;
    nums.add(nuw);
  }
  if(!rec_ranz(k,0,x)) y.add(x);
}
