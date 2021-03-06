package armory.logicnode;

import iron.math.Vec4;
import iron.system.Input;

/*
This file was previously GamepadCoordsNode.hx and was renamed to be updated
Original author: luboslenco
Contributor(s): zaethan
*/

class GetGamepadCoordsNode extends LogicNode {

	var coords = new Vec4();

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var index: Int = inputs[0].get();

		if (index == null) return null;

		var gamepad = Input.getGamepad(index);

		if (from == 0) {
			coords.x = gamepad.leftStick.x;
			coords.y = gamepad.leftStick.y;
			return coords;
		}
		else if (from == 1) {
			coords.x = gamepad.rightStick.x;
			coords.y = gamepad.rightStick.y;
			return coords;
		}
		else if (from == 2) {
			coords.x = gamepad.leftStick.movementX;
			coords.y = gamepad.leftStick.movementY;
			return coords;
		}
		else if (from == 3) {
			coords.x = gamepad.rightStick.movementX;
			coords.y = gamepad.rightStick.movementY;
			return coords;
		}
		else if (from == 4) {
			return gamepad.down("l2");
		}
		else if (from == 5) {
			return gamepad.down("r2");
		}

		return null;
	}
}
