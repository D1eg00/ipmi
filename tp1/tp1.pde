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
 background(252,242,242);
  image (manzana1,0,0,400,400);
  noStroke();
 // manzana

 fill(165,20,20);
  ellipse(600,235,370,310);
   
// tallo 
fill(69,155,72);
  rect(575,50,100,6);
  
 
  fill(0,180,10);
  rect(600,30,130,40,180,180,180,180);

   // H
     fill (72,25,37);
  rect(575,20,10,100,100,100,0,0);
  //
  fill(219,71,71);
  circle(570,200,25);
  //
  fill(219,71,71);
  circle(480,290,10);
  
  circle(610,265,15);
  //
  circle(660,140,20);
  
}
