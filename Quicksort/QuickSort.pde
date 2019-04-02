//Declare arrays
float[] values;
float[] backup;
ArrayList<Swap> swaps;

int swapIndex=0;
boolean sorted=false;

void setup() {
  size(1000, 500);
  frameRate(45);
  
  //Initialize arrays with width of window
  values = new float[width/10];
  backup = new float[width/10];
  
  swaps = new ArrayList<Swap>();
  
  //Calculate a random height for each line
  for (int i=0; i<values.length; i++) {
    values[i] = random(20, height-10);
  }
  
  arrayCopy(values, backup);
  
  quickSort(values, 0, values.length-1);
  sorted = true;
}

void draw() {
  background(0);
  
  if(swapIndex < swaps.size()) {
    Swap sw = swaps.get(swapIndex);
    swap(backup, sw.a, sw.b);
    swapIndex++;
  }
  
  //Create rectangle with height from values
  for (int i=0; i<backup.length; i++) { 
    fill(#ffffff);
    rect(i*10, height - backup[i], 10, backup[i]);
  }
}

//quick sort (pivot is middle of array)
void quickSort(float[] values, int start, int end) {
  if(start >= end) return;
  
  int index = partition(values, start, end);
  
  quickSort(values, start, index-1);
  quickSort(values, index+1, end);
}

int partition(float[] values, int start, int end) {
  int pivotIndex = start;
  //Get pivot value from the middle list
  float pivotValue = values[end];
  
  for(int i=start; i<end; i++) {
    if(values[i]<pivotValue) {
      swap(values, i, pivotIndex);
      pivotIndex++;
    }
  }
  
  swap(values, pivotIndex, end);
  
  return pivotIndex;
}

void swap(float[] values, int a, int b) {
  
  if(!sorted) {
    swaps.add(new Swap(a,b));
  }
  
  float temp = values[a];
  values[a] = values[b];
  values[b] = temp;
}
