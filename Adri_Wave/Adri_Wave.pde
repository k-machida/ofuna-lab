


import processing.serial.*;
rtPlot plot1,plot2;
String port;
Adio adio;
int[] x_range = {0,1023};
int[] y_range = {0,1023};


void setup()
{
  size(400,400);
  plot1 = new rtPlot(50,50,300,100,x_range,y_range);  
  plot2 = new rtPlot(50,50,300,100,x_range,y_range);  
  String port = Adio.list()[5];
  adio = new Adio(this, port, 115200);
 
}

int vctrl=0,vmonit=0;
int intg=0;
void draw(){
  background(255);
  vctrl  = adio.analogRead(3);
  vmonit = adio.analogRead(2);
  plot1.update(vctrl);
  plot2.update(vmonit);
  vctrl = vctrl + 1*(vctrl - vmonit);
  intg = intg+10*(vctrl - vmonit);
  vctrl = vctrl + intg;
  adio.analogWrite(6,int(map(vctrl,0,1023,0,255)));
  delay(20);
}
