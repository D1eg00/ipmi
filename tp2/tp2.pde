/* comisión 5
Diego Miranda 91378/5

*/

// IMAGEN
PImage imagen1,imagen2,imagen3,imagen4;

// cadena de texto:
String pantalla;

String txt1 = "Los tres cerditos";
String txt2 = "Tres cerditos hacen sus casas, pero para tardar\n menos y jugar, los dos primeros las hacen de paja\n y maderas, mientras el mayor se esfuerza más y la\n hace de ladrillo. Cuando llega el lobo feroz, \nsoplando tira las casas del primero";
String txt3 = "y el primer cerdito al ser derivado su casa se refugia\n en la casa del segundo, luego el lobo dijo soplares\n y soplares y soplando tira las casas del segundo,\n los dos cerditos se refugian en la casa del tercero.";
String txt4 = "Como no puede tirar la última casa soplando, trata de \nentrar por la chimenea, pero los cerditos preparan un\n caldero y el lobo huye abrasado.\n FIN ";

// Tamaño inicial
int maX = 12;
int miN = 1; 

int tamFont;
int tiempo;        //variable que cuenta el tiempo transcurrido
int velX, velY;           // velocidad
float posX, posY, botT;   // posicion y tamaño
color relleno;           

void setup() {
  size(640, 480);
  textSize(20);
  textAlign(CENTER,CENTER);
  noStroke();
  
  //IMAGEN LOSTRESCERDITOS 1,2,3,4
  imagen1= loadImage("LOSTRESCERDITOS1.jpg");
  imagen2= loadImage("LOSTRESCERDITOS2.jpg");
  imagen3= loadImage("LOSTRESCERDITOS3.jpg");
  imagen4= loadImage("LOSTRESCERDITOS4.jpg");
  
  // ASIGNACIONES DE VARIABLES
  
  pantalla = "menu";    //pantalla arranca en "menu" y tiempo en 0
  tiempo = 0;
  
  posX =width/2 ;
  posY = height/4*3; 
  botT = 100;
  
  velX = 10;
  velY += 1;
  tamFont = 0;
  
  // color
  relleno = color(0);
  
  frameRate(60);
}

void draw() {
  
  background(relleno);     //pintar el fondo de color
  
  

//cuando pantalla está en "menu"
  if (pantalla ==("menu")) {
    //velY += 1;
    relleno = color(0);    //cambiar color del fondo
    image(imagen1, 0, 0, width, height);
    text("tiempo: "+tiempo, 100,50);    //mostrar tiempo
    text("pantalla: "+pantalla, 100,100);    //mostrar pantalla
    //push(); y pop(); para que solo afecte adentro
    push();
    //fill(0,0,255);
    textSize(tamFont);
    text(txt1, width/2, height/2);
    tamFont++;
    pop();
    tiempo++;
    if(tiempo >= frameRate*5){        //cuando hayan pasado 60*5 frames
      pantalla = "p2";       //pasar a pantalla 1
      //velY = 0;
      tiempo = 0;      //y reiniciar tiempo
      
    }
    
    if(dist(mouseX,mouseY,posX,posY) < botT/2){      //si pongo el mouse en el botón (mouseOver), pintar de rojo
      fill(255,0,0);
      
    }else{
      fill(255);        //si no pongo el mouse en el botón, pintar de blanco 
     
    }
    ellipse(posX,posY, botT,botT);      //dibujar botón para siguiente pantalla
    
    fill(255);    //para que el color del botón no afecte al texto
    //fill(0);    
    text("Iniciar", posX,posY);
    
    
//cuando pantalla está en "p2"
  } else if (pantalla == ("p2")) {
     velY += 1;
    relleno = color(100);    //cambiar color del fondo
    image(imagen2, 0, 0, width, height);
    text("tiempo: "+tiempo, 100,50);    //mostrar tiempo
    text("pantalla: "+pantalla, 100,100);    //mostrar pantalla
    push();
    //textSize(tamFont);
    textSize(30);
    text(txt2, width/2,height-velY);
    //tamFont++;
    pop();
    
    
    tiempo++;
    if(tiempo >= frameRate*10){        //cuando hayan pasado 60*10 frames
      pantalla = "p3";                //...pasar a pantalla 2
      tiempo = 0;      //y reiniciar tiempo
      tamFont = 0;
    }


//cuando pantalla está en "p3"
  } if (pantalla == ("p3")) {
    relleno = color(300);    //cambiar color del fondo
    image(imagen3, 0, 0, width, height);
    text("tiempo: "+tiempo, 100,50);    //mostrar tiempo
    text("pantalla: "+pantalla, 100,100);    //mostrar pantalla
    velY -= 1;
    push();
    textSize(28);
    text(txt3, width/2, height/2-velY);
    pop();
    tiempo++;
    if(tiempo >= frameRate*12){        //cuando hayan pasado 60*12 frames
      pantalla = "p4";                //...pasar a pantalla 2
      tiempo = 0;                      //y reiniciar tiempo
    }
    
    
//cuando pantalla está en "p4"
  } else if (pantalla == ("p4")) {
    relleno = color(200);    //cambiar color del fondo
    image(imagen4, 0, 0, width, height);
    text("tiempo: "+tiempo, 100,50);    //mostrar tiempo
    text("pantalla: "+pantalla, 100,100);    //mostrar pantalla
    push();
    textSize(maX);
    text(txt4, width/2, height/2);
    pop();
    maX += miN;
   
    if(maX > 40 || maX < 12){
      miN = -miN;
    }
    
    if(dist(mouseX,mouseY,posX,posY) < botT/2){      //si pongo el mouse en el botón se pintar de rojo
      fill(255,0,0);
    }else{
      fill(255);        //si no pongo el mouse en el botón, pintar de blanco 
  }
    ellipse(posX,posY, botT,botT);      //dibujar botón para siguiente pantalla
    
    fill(255);    //para que el color del botón no afecte al texto
    text("Reiniciar", posX,posY);

  }
  
  println(frameRate);
}

//se ejecuta cuando se presiona el mouse.
void mousePressed(){                              //si estoy apretando el "clic"
  if(pantalla ==("menu")){                        // estoy en la pantalla de menu
    if(dist(mouseX,mouseY,posX,posY) < botT/2){          // pongo el mouse en el botón
      pantalla = "p2";                                 
      velY = 0;
      tiempo = 0;                                        //y reiniciar tiempo
  }
  }
  // pantalla 4 + boton de reinicio.
  if(pantalla ==("p4")){                        // Estoy en la pantalla 4
    if(dist(mouseX,mouseY,posX,posY) < botT/2){          // pongo el mouse en el botón
      pantalla = "menu";                                   // volver a pantalla menu
      tiempo = 0;                                        // reiniciar tiempo
    }
  }
}
