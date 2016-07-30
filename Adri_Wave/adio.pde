class Adio extends Serial{
  int value;        // Fetched value from serial port
  String char0;        // 
  String char1;        // 
  String char2;
  Adio(PApplet prgm, String portName, int speed) {
    super(prgm, portName, speed);
  }

  void chkstr(String str) {
    if ( str != "input" && str != "i" && str != "output" && str != "o" ) {
      println("Error: Wrong strings of " + str);
      return;
    }
  }
  
  void chkpin(int pin) {
    if ( pin < 2 || pin > 69 ) {
      println("Error: Wroung pin number " + pin);
      return;
    }
  }
  
  String int2str( int x ) {
    return String.valueOf(char(x));
  }

  int pinMode(int pin, String str) {
    chkstr(str);
    chkpin(pin);
    char2 = "0";          // '0xx' : assigns digital pin as input/output
    char1 = int2str(97+pin); // 'c' is pin#2, 'd' is pin#3...  
    if( str == "input"  || str == "i" ) { 
      char0 = "0"; 
    }
    
    if( str == "output" || str == "o" ) { 
      //println("ok");
      char0 = "1"; 
    }
      this.write(char2+char1+char0);
      //println(char2+char1+char0);
      return pin;
  } 

  int digitalRead(int pin) {
    chkpin(pin);
    char2 = "1";
    char1 = int2str(97+pin);
    this.write(char2+char1);
    value = this.read();
    return int(value);     
  }

  
  int digitalWrite(int pin, int val) {
    chkpin(pin);
    char2 = "2";
    char1 = int2str(97+pin); // 'c' is pin#2, 'd' is pin#3...
    
    switch(val) {
      case 0:
        char0 = "0";
        break;
      case 1:
        char0 = "1";
        break;
      default:
        return -1;
    }      
    this.write(char2+char1+char0);  
    return pin;
  }
  
  int analogRead(int pin) {
    int h_value = 0;
    int l_value = 0;
    chkpin(pin);
    char2 = "3";
    char1 = int2str(97+pin);
    this.write(char2+char1);
    h_value = this.read();
    l_value = this.read();
    println(h_value*256+l_value);
    return h_value*256+l_value;
  }
  
  int analogWrite(int pin, int val) {
    chkpin(pin);
    char2 = "4";
    char1 = int2str(97+pin);
    char0 = int2str(val);
    if ( val < 0 ) {
      char0 = int2str(0);
    }
    if ( val > 255 ) {
      char0 = int2str(255);
    }
    this.write(char2+char1+char0);
    return pin;
  }
  
  
  
}

  /*
  
  void delete() {}
 
        function disp(a)
        function str=serial(a)
        function val=flush(a)
       
        function analogReference(a,str)
        function servoAttach(a,pin)
        function servoDetach(a,pin)
        function val=servoStatus(a,pin)
        function val=servoRead(a,pin)
        function servoWrite(a,pin,val)
        function encoderAttach(a,enc,pinA,pinB)
        function encoderDetach(a,enc)
        function val=encoderStatus(a,enc)
        function val=encoderRead(a,enc)
        function encoderReset(a,enc)
        function encoderDebounce(a,enc,del)
        function val=roundTrip(a,byte)
        function val=motorSpeed(a,num,val)
        function motorRun(a,num,dir)
        function val=stepperSpeed(a,num,val)
        function stepperStep(a,num,dir,sty,steps)
        function errstr=checknum(num,description,allowed)
        function errstr=checkstr(str,description,allowed)
        function errstr=checkser(ser,chk)
  */
