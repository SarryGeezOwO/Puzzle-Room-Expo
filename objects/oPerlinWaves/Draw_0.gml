shader_set(shWater)

shader_set_uniform_f(uniTime, current_time)

var texture = sprite_get_texture(sWaterTex, 0);

shader_set_uniform_f(uniTexel, texture_get_texel_width(texture), texture_get_texel_height(texture))

draw_sprite_ext(sWaterTex, -1, x,y, image_xscale, image_yscale, 0, c_white, 0.25)
shader_reset()