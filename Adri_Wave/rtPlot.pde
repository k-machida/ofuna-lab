
class rtPlot {
  
  int originX;
  int originY;
  int sizeX;
  int sizeY;
  float[] wave_data;
  int[] rangeX= new int[2];
  int[] rangeY= new int[2];
  
  rtPlot(int originX_, int originY_, int sizeX_, int sizeY_, int[] rangeX_, int[] rangeY_) {
    originX = originX_;
    originY = originY_;
    sizeX   = sizeX_;
    sizeY   = sizeY_;
    rangeX  = rangeX_;
    rangeY  = rangeY_;
    wave_data = new float[sizeX];    
  }
  
  void update(int value) {
    axis();
    pushMatrix();
    translate(originX,originY);
    plotWave(value);
    popMatrix();
  }
  
  void axis() {
    stroke(255,0,0);
    line(originX, originY+sizeY, originX+sizeX, originY+sizeY);
  }
  
  void plotWave(int value) {
    stroke(0);
    wave_data[wave_data.length-1] = int(map(value,rangeY[0],rangeY[1],sizeY,0));
  
    for(int i = 0; i < wave_data.length-1; i++) {
      line(i, wave_data[i], i+1, wave_data[i+1]);
      wave_data[i] = wave_data[i+1];
    }
  }
}







