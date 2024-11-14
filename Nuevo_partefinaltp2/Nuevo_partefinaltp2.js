let juego;
function preload() {
}

function setup() {
  createCanvas(640, 480);
  juego = new Juego();
}

function draw() {
  background(100);
  juego.actualizar();
}

function mousePressed() {
  juego.mousePressed();
}
