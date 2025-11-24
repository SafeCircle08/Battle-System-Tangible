#macro BATTLE_BOX_BASE_W 60
#macro BATTLE_BOX_BASE_H 60
#macro BATTLE_BOX_BASE_X room_width / 2
#macro BATTLE_BOX_BASE_Y room_height / 2 + 15


enum BOX_VERTEXES {
	TOP_RIGHT,
	TOP_LEFT, 
	BOTTOM_LEFT,
	BOTTOM_RIGHT
}

function getBattleBoxVertexX(_vertex) {
	switch (_vertex) {
		case BOX_VERTEXES.TOP_LEFT: return (global.boxOriginX - (global.borderWidth / 2));
		case BOX_VERTEXES.TOP_RIGHT: return (global.boxOriginX + (global.borderWidth / 2));
		case BOX_VERTEXES.BOTTOM_RIGHT: return (global.boxOriginX + (global.borderWidth / 2));
		case BOX_VERTEXES.BOTTOM_LEFT: return (global.boxOriginX - (global.borderWidth / 2));
	}
}

function getBattleBoxVertexY(_vertex) {
	switch (_vertex) {
		case BOX_VERTEXES.TOP_LEFT: return (global.boxOriginY - (global.borderHeight / 2));
		case BOX_VERTEXES.TOP_RIGHT: return (global.boxOriginX - (global.borderHeight / 2));
		case BOX_VERTEXES.BOTTOM_RIGHT: return (global.boxOriginX + (global.borderHeight / 2));
		case BOX_VERTEXES.BOTTOM_LEFT: return (global.boxOriginX + (global.borderHeight / 2));
	}
}