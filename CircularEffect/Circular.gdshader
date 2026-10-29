shader_type canvas_item;

uniform float radius = 100.0;
uniform float speed = 1.0;
uniform float text_width = 300.0;

uniform float angle_offset_degrees = 0.0; 

void vertex() {
    float centered_x = VERTEX.x - (text_width / 2.0);
    
    float base_angle = centered_x / radius;
    
    float offset_radians = radians(angle_offset_degrees);
    
    float angle = base_angle + (TIME * speed) + offset_radians;
    
    float dist = radius - VERTEX.y;
    
    VERTEX.x = (sin(angle) * dist) + (text_width / 2.0);
    VERTEX.y = radius - (cos(angle) * dist);
}