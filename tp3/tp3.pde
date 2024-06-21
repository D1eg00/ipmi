/* Diego Miranda
 DNI 43102451
 lejago: 91378/5
 youtube: https://youtu.be/VSa60MeR2Jo
 */

// Imagena
PImage imagen1;

int cantidad = 20; //
float lado;
boolean ConClic = true; // Variable para controlar el estado del color

void setup() {
  size(800, 400);

  imagen1 = loadImage("obras_atracta.png");
  

  rectMode(CENTER);

  frameRate(60);
}

void draw() {
  background(255); // Fondo blanco
  lado = width/cantidad;
  image(imagen1, 0, 0, width/2, height);

  // Usar la función que retorna un valor para obtener el color de la elipse
  color currentColor = getEllipseColor(ConClic);
  fill(currentColor);



  for (int x = cantidad/2; x < cantidad; x++) {
    for (int y = 0; y < cantidad; y++) {
      push();

      if (x % 2 == 0 && y  % 2 != 0 && ConClic) {
        fill(255);
      } else {
        fill(0);
      }
      if (x % 2 != 0 && y  % 2 == 0 && ConClic ) {
        fill(255);
      }

      translate(x * lado, y * lado);
      DibujoRect(lado/2, lado/2, lado);

      pop();

      push();
      if (x % 2 == 0 && y  % 2 != 0 && ConClic) {
        fill(0);
      } else {
        fill(255);
      }
      if (x % 2 != 0 && y  % 2 == 0 && ConClic) {
        fill(0);
      }


      translate(x * lado, y * lado);
      rotate(map(width, 0, height, 0, PI*2));
      DibujoEllipse(lado/2, lado/2, lado);

      pop();
    }
  }
  println(frameRate);
}


void mousePressed() {
  // Al presionar el mouse, cambiar el estado de isClicked
  ConClic = false;
  cantidad ++;
}

void keyPressed() {
  // Al presionar una tecla, regresar al estado original
  ConClic = true;
  cantidad = 20;
}
