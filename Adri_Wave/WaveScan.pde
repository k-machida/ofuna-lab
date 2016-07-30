class WaveScan {
  
  int w;
  int h;
  int x;
  int y;
  float[] v;
  
  
  WaveScan(int ori_x, int ori_y, int plot_width, int plot_height) {
     x = ori_x;
     y = ori_y;
     w = plot_width;
     h = plot_height;
     v = new float[w];
  }
  
  void update(float data) {
    v[0] = map(data,0,1024,0,h); 
    pushMatrix();
    translate(x,y);
    ellipse(0,v[0],10,10);
    popMatrix();
  }
  
  
  
}


