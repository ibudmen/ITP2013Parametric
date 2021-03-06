
ArrayList<Integer> colList;

void buildColor() {
  colList=new ArrayList<Integer>();
  
  int[] grad=new int[] {
    color(255,0,0), color(255,255,0),
    color(255), color(0,150,200),
    color(255), color(255,0,128)
  };
  
  int ng=grad.length/2;
  for(int i=0; i<ng; i++) {
    int num=(int)random(3,9);
    for(int j=0; j<num; j++) {
      float t=map(j, 0,num-1, 0,1);
      int theCol=lerpColor(grad[i*2],grad[i*2+1], t);
      colList.add(theCol);
    }
  }
  
  println(colList.size());
  for(int c:colList) println(UMB.hex(c));
}

int randomColor() {
  return colList.get((int)random(colList.size()));
}

