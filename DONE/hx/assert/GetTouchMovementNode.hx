package armory.logicnode;

import iron.math.Vec4;
import iron.system.Input;

class GetTouchMovementNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var surface = Input.getSurface();
		var multX: Float = inputs[0].get();
		var multY: Float = inputs[1].get();

		if (multX == null || multY == null) return null;

		return switch (from) {
			default: null;
			case 0: surface.movementX;
			case 1: surface.movementY;
			case 2: surface.movementX * multX;
			case 3: surface.movementY * multY;
		}
	}
}
