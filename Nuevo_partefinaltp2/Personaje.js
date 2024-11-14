class Personaje {
  constructor() {
    this.x = width / 2;
    this.y = 390;
    this.vel = 8;
    this.ancho = 60;
    this.alto = 80;
    this.img = loadImage("data/Personaje.png");
  }

  actualizar() {
    this.mover();
    this.dibujar();
  }

  dibujar() {
    push();
    translate(this.x, this.y);
    image(this.img, 0, 0, this.ancho, this.alto);
    pop();
    
    
    
  }

  mover() {
    if (keyIsPressed) {
      if (keyCode === LEFT_ARROW && this.x > 0) {
        this.x -= this.vel;
      } else if (keyCode === RIGHT_ARROW && this.x < width - this.ancho) {
        this.x += this.vel;
      }
    }
  }
}
