/* comisión 5
Diego Miranda 91378/5
DNI: 43102451

*/
PImage manzana1;
void setup (){
  size(800,400);
   
  manzana1= loadImage("manzana.png");
}

void draw (){
 background(255,255,255);
  image (manzana1,0,0,400,400);
 // noStroke();
 // manzana

 fill(214,35,35);
  ellipse(600,235,370,310);
   
// tallo 
fill(69,155,72);
  rect(575,50,100,6);
  
 
  fill(0,180,10);
  rect(600,30,130,40,180,180,180,180);

   // H
     fill (72,25,37);
  rect(575,20,10,100,100,100,0,0);
  
}
