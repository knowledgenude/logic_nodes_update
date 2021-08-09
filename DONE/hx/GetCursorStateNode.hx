package armory.logicnode;

import iron.system.Input;

class GetCursorStateNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var mouse = Input.getMouse();

		return switch (from) {
			default: false;
			case 0: mouse.hidden && mouse.locked;
			case 1: mouse.hidden;
			case 2: mouse.locked;
		}
	}
}
