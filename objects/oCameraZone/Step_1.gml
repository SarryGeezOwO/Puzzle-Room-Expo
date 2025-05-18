with(oPlayer) {
	if (position_meeting(x, y, oCameraZone)) {
		var zone = instance_position(x, y, oCameraZone)
		if (zone.zone_id == other.zone_id) {
			camera_set_view_pos(view_get_camera(0), other.x, other.y)	
		}
	}
}