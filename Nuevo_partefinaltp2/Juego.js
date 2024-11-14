class Juego {
  constructor() {
    this.iniciar();
  }

  iniciar() {
    this.estado = "inicio";
    this.p = new Personaje();
    this.botonInicio = new Boton("INICIAR", width / 2, height * 0.75, 100, 40);
    this.botonReinicio = new Boton("REINICIAR", width / 2, height * 0.75, 100, 40);
    this.enemigos = [];
    this.cant = 6;
    this.velocidadBase = 2;
    this.img = loadImage("data/estado.png");
    for (let i = 0; i < this.cant; i++) {
      this.enemigos[i] = new Enemigo(this.velocidadBase);
    }
  }

  actualizar() {
    if (this.estado === "inicio") {
      this.pantallaInicio();
    } else if (this.estado === "jugando") {
      this.pantallaJugando();
    } else if (this.estado === "fin") {
      this.pantallaFin();
    }
  }

  pantallaInicio() {
    push();
    background(0);
    this.botonInicio.actualizar();
    pop();
  }

  pantallaJugando() {
    image(this.img, 0, 0, width, height);
    this.velocidadBase += 0.001;
    for (let i = 0; i < this.enemigos.length; i++) {
      this.enemigos[i].actualizar(this.velocidadBase);
    }
    this.p.actualizar();
    for (let i = 0; i < this.enemigos.length; i++) {
      if (this.enemigos[i].evaluaColision(this.p.x, this.p.y)) {
        this.estado = "fin";
        break;
      }
    }
    push();
  }

  pantallaFin() {
    push();
    background(150, 0, 0);
    textSize(32);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Fin del Juego", width / 2, height / 2 - 40);
    textSize(16);
    this.botonReinicio.actualizar();
    pop();
  }

  mousePressed() {
    if (this.estado === "inicio") {
      if (this.botonInicio.colisionMouse()) {
        this.estado = "jugando";
      }
    } else if (this.estado === "fin") {
      if (this.botonReinicio.colisionMouse()) {
        this.iniciar();
        this.estado = "jugando";
      }
    }
  }
}
