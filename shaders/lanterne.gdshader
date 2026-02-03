shader_type canvas_item;

uniform float amplitude = 3.0;  // hauteur du mouvement
uniform float speed = 3.0;       // vitesse de lévitation
uniform float scale_amount = 0.5; // léger scaling
  
void vertex() {
    // Oscillation verticale
    float offset = sin(TIME * speed) * amplitude / 5.0;
    VERTEX.y += offset;
}