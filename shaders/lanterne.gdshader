shader_type canvas_item;

uniform float amplitude = 5.0;  // hauteur du mouvement
uniform float speed = 10.0;       // vitesse de lévitation
uniform float scale_amount = 0.0; // léger scaling
  
void vertex() {
    // Oscillation verticale
    float offset = sin(TIME * speed) * amplitude / 10.0;
    VERTEX.y += offset;
}