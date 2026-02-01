shader_type canvas_item;

uniform vec4 Hair1 : source_color = vec4(0.243, 0.208, 0.275,1);
uniform vec4 Hair2 = vec4(0.18, 0.133, 0.184,1);
uniform vec4 Hair3 = vec4(0.384, 0.333, 0.396,1);

uniform vec4 target_eyes : source_color = vec4(0.302,0.6078,0.902,1);
uniform vec4 Bijoux1 : source_color = vec4(0.9765, 0.7608, 0.1686, 1.0);
uniform vec4 Bijoux2 : source_color = vec4(0.18, 0.133, 0.184,1);
uniform vec4 Bijoux3 : source_color = vec4(0.384, 0.333, 0.396,1);

uniform vec4 replace_Hair1 : source_color  = vec4(0.243, 0.208, 0.275,1);
uniform vec4 replace_Hair2 = vec4(0.18, 0.133, 0.184,1);
uniform vec4 replace_Hair3 = vec4(0.384, 0.333, 0.396,1);
uniform vec4 replace_eyes : source_color = vec4(0.302,0.6078,0.902,1);

uniform vec4 replace_Bijoux1 : source_color = vec4(0.9765, 0.7608, 0.1686, 1.0);

uniform float tolerance : hint_range(0, 1) = 0.07;

void fragment() {
    vec4 original = texture(TEXTURE, UV); // 🔒 couleur originale
    vec4 result = original;
    float dist;

    dist = distance(original.rgb, Hair1.rgb);
    if (dist < tolerance) result.rgb = replace_Hair1.rgb;

    dist = distance(original.rgb, Hair2.rgb);
    if (dist < tolerance) result.rgb = replace_Hair2.rgb;

    dist = distance(original.rgb, Hair3.rgb);
    if (dist < tolerance) result.rgb = replace_Hair3.rgb;

    dist = distance(original.rgb, target_eyes.rgb);
    if (dist < tolerance) result.rgb = replace_eyes.rgb;

    dist = distance(original.rgb, Bijoux1.rgb);
    if (dist < tolerance) result.rgb = replace_Bijoux1.rgb;
	
	dist = distance(original.rgb, Bijoux1.rgb);
    if (dist < tolerance) result.rgb = replace_Bijoux1.rgb;

    COLOR = result;
}
