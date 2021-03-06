package armory.logicnode;

import iron.math.Vec4;
import iron.system.Input;

class GetCursorLocationNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var mouse = Input.getMouse();

		return switch (from) {
			default: null;
			case 0: mouse.x;
			case 1: mouse.y;
			case 2: mouse.x * -1.0;
			case 3: mouse.y * -1.0;
		}
	}
}
