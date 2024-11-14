class Juego {
  constructor() {
    this.iniciar();
  }

  iniciar() {
    this.estado = "inicio";
    this.p = new Personaje();
    this.botonInicio = new Boton("INICIAR", width / 2, height * 0.75, 100, 40);
    this.botonReinicio = new Boton("REINICIAR", width / 2, height * 0.75, 100, 40);
    this.basura = [];
    this.cant = 6;
    this.velocidadBase = 2;
    this.img = loadImage("data/estado.png"); // Cargar la imagen de fondo

    // Crear los objetos "basura"
    for (let i = 0; i < this.cant; i++) {
      this.basura[i] = new Basura(this.velocidadBase);
    }
  }

  actualizar() {
    if (this.estado === "inicio") {
      this.pantallaInicio();
    } else if (this.estado === "jugando") {
      this.pantallaJugando(); // Llama a pantallaJugando cuando el estado es "jugando"
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
    // Dibujar la imagen de fondo
   
    image(this.img, 0, 0, width, height);
 pop();
    // Aumentar gradualmente la velocidad de los objetos "basura"
    this.velocidadBase += 0.001;

    // Actualizar y dibujar cada objeto "basura"
    for (let i = 0; i < this.basura.length; i++) {
      this.basura[i].actualizar(this.velocidadBase);
    }

    // Actualizar y dibujar al personaje
    this.p.actualizar();

    // Verificar colisiones con los objetos "basura"
    for (let i = 0; i < this.basura.length; i++) {
      if (this.basura[i].evaluaColision(this.p.x, this.p.y)) {
        this.estado = "fin"; // Fin del juego si hay colisión
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
    //text("Haz clic en REINICIAR para jugar de nuevo", width / 2, height / 2);
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
