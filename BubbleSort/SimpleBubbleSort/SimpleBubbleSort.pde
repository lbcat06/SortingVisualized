//Initialize array
float[] values;
int i=0;
int j=0;

void setup() {
  size(1000, 500);
  frameRate(60);
  
  //Declare array with width of window
  values = new float[width/10];
  
  //Calculate a random height for each line
  for (int i=0; i<values.length; i++) {
    values[i] = random(20, height-10);
  }
  

}

void draw() {
  background(0);
  
  if(i < values.length) {    
    if(values[j] < values[j+1]) {
      float temp = values[j];
      values[j] = values[j+1];
      values[j+1] = temp;
    } 
    
    j++;
    
    if(j >= (values.length-1-i)) {
      j=0;
      i++;
    }
    
  } else {
    //Finished
    noLoop();
  }
  
  
  //Create rectangle with random height per value
  for (int i=0; i<values.length; i++) {
    fill(#ffffff);
    if(i==j) {
      fill(#9c50f8);
    }
    rect(i*10, height, 10, -(height-values[i]));
  }
}
