package armory.logicnode;

import kha.FastFloat;
import iron.system.Input;

class GetMouseMovementNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var multX: FastFloat = inputs[0].get();
		var multY: FastFloat = inputs[1].get();
		var multWheelDelta: FastFloat = inputs[2].get();

		if (multX == null || multY == null || multWheelDelta == null) return null;

		var mouse = Input.getMouse();

		return switch (from) {
			default: null;
			case 0: mouse.movementX;
			case 1: mouse.movementY;
			case 2: mouse.movementX * multX;
			case 3: mouse.movementY * multY;
			case 4: mouse.wheelDelta;
			case 5: mouse.wheelDelta * multWheelDelta;
		}
	}
}
