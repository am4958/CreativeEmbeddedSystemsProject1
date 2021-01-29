//current size - continuously updated
float size = 10;
//minimum size
float minSize = 10;
//maximum size
float maxSize = 500;
//change speed for size (how much will the size increase/decrease each frame)
float sizeSpeed = 2;
float[] randosSize = new float[20];
float[] randosX = new float[20];
float[] randosY = new float[20];
Boolean grow = true;
float stopSize = 0;
Boolean fly = false;
String breathe = "Breathe";
String flying = "Look Up";
PFont font;
 
void circ(){

   //if the size is either too small, or too big, flip the size speed sign (if it was positive (growing) - make it negative (shrink) - and vice versa)
  if( size > maxSize) {
    sizeSpeed *= -1;
    stopSize = 11;


  }
  //increment the size with the size speed (be it positive or negative)
  size += sizeSpeed;

 
    if (size <= stopSize){
      grow = false;
      print("grow :circ" + grow);
      fly = true;
      print("fly: circ" + fly);
      sizeSpeed *= -1;
      //randos();
      //grow = true;
    }  
    

}


void flyTime(){
   if (fly == true){

     fill(0);
     text(flying, 450, 100);
     fill(36, 162, 216);
     noStroke();

       ellipse(randosX[0], randosY[0], randosSize[0], randosSize[0]);
       ellipse(randosX[1], randosY[1], randosSize[1], randosSize[1]);
       ellipse(randosX[2], randosY[2], randosSize[2], randosSize[2]);
       ellipse(randosX[3], randosY[3], randosSize[3], randosSize[3]);
       ellipse(randosX[4], randosY[4], randosSize[4], randosSize[4]);
       ellipse(randosX[5], randosY[5], randosSize[5], randosSize[5]);
       ellipse(randosX[6], randosY[6], randosSize[6], randosSize[6]);
       ellipse(randosX[7], randosY[7], randosSize[7], randosSize[7]);
       ellipse(randosX[8], randosY[8], randosSize[8], randosSize[8]);
       ellipse(randosX[9], randosY[9], randosSize[9], randosSize[9]);
       ellipse(randosX[10], randosY[10], randosSize[10], randosSize[10]);
       ellipse(randosX[11], randosY[11], randosSize[11], randosSize[11]);
       ellipse(randosX[12], randosY[12], randosSize[12], randosSize[12]);
       ellipse(randosX[13], randosY[13], randosSize[13], randosSize[13]);
       ellipse(randosX[14], randosY[14], randosSize[14], randosSize[14]);
       ellipse(randosX[15], randosY[15], randosSize[15], randosSize[15]);
       ellipse(randosX[16], randosY[16], randosSize[16], randosSize[16]);
       ellipse(randosX[17], randosY[17], randosSize[17], randosSize[17]);
       ellipse(randosX[18], randosY[18], randosSize[18], randosSize[18]);
      
   for (int i =0; i < 19; i++){
     randosY[i]--;
   }
     if (randosY[4] <= 0) {
        fly = false;
        randos();
        print("fly: flittime" + fly);
        grow = true;
        print ("grow: flytime" + grow);
      }
   
   
   }
     
 
}
  

 

  
  

void setup(){
  fullScreen();
  randos();
  //printArray(PFont.list());
  font = createFont("Helvetica", 100);
  textFont(font); 
}

void randos(){
  for (int i = 0; i < 19; i ++){
    randosSize[i] = random(50,80); 
    randosX[i] = random(1500);
    randosY[i] = random (400, 800);
  }
}

void draw(){  
     background(252, 251, 254); 
   
   if(grow == true){
    
   
    circ();
   fill(213, 119, 46);
   ellipse(625, 450, size,size);
   
   
   //textSize(70);
   fill(0);
   text(breathe, 450, 100);
   
   }
   if (fly == true){
     flyTime();
     
   }
  
   
   
   
    


     
      
}


//refrenced for growing ellipse: https://stackoverflow.com/questions/35156661/how-to-make-the-size-of-ellipse-to-get-smaller-and-bigger-in-processing-automati
