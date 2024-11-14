class Basura {
  constructor(velocidadBase) {
    this.tipo = int(random(0, 2));
    this.reiniciarUbicacion();
    this.lado = 80;
    this.velocidadBase = velocidadBase;
    this.img = loadImage("data/Mono_" + this.tipo + ".png");
    //this.img1 = loadImage("data/estado.png");
  }

  actualizar(velocidadIncrementada) {
    this.mover(velocidadIncrementada);
    this.dibujar();
  }

  mover(velocidadIncrementada) {
    this.y += this.despY * velocidadIncrementada;
    if (this.y > height + 150) {
      this.reiniciarUbicacion();
    }
  }

  dibujar() {
    push();
    //image(this.img1, 0, 0, width, height);
    translate(this.x, this.y);
    imageMode(CENTER);
    image(this.img, 0, 0, this.lado, this.lado);
    pop();
  }

  reiniciarUbicacion() {
    this.x = random(100, width - 100);
    this.y = -150 - random(100, 400);
    this.despY = random(1, 3);
  }

  evaluaColision(x_, y_) {
    return dist(this.x, this.y, x_, y_) < this.lado / 2;
  }
}
