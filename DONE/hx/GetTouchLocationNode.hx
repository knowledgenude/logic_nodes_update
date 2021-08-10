package armory.logicnode;

import iron.math.Vec4;
import iron.system.Input;

class GetTouchLocationNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var surface = Input.getSurface();

		return switch (from) {
			default: null;
			case 0: surface.x;
			case 1: surface.y;
			case 2: surface.x * -1.0;
			case 3: surface.y * -1.0;
		}
	}
}
