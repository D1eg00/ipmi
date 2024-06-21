// Función que retorna el color de la elipse basado en el estado
color getEllipseColor(boolean ConClic) {
  if (ConClic) {
    return color(0); // Blanco
  } else {
    return color(255); // Negro
  }
}

// Funcion que no retorna valor = tipo void (PARA DIBUJA)
void DibujoRect (float x, float y, float lado) {

  stroke(1);
  rect(x, y, lado, lado);
}

// Funcion que no retorna valor = tipo void (PARA DIBUJA)
void DibujoEllipse (float x, float y, float lado) {

  stroke(1);
  ellipse(x, y, lado/2, lado/2);
}
