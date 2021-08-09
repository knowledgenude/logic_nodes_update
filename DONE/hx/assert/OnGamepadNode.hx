package armory.logicnode;

import iron.system.Input;

class OnGamepadNode extends LogicNode {

	public var property0: String;
	public var property1: String;

	public function new(tree: LogicTree) {
		super(tree);

		tree.notifyOnUpdate(update);
	}

	function update() {
		var num: Int = inputs[0].get();
		var gamepad = Input.getGamepad(num);

		if (gamepad == null) return;

		var b = false;
		switch (property0) {
			case "started": b = gamepad.started(property1);
			case "down": b = gamepad.down(property1) > 0.0;
			case "released": b = gamepad.released(property1);
		}

		if (b) runOutput(0);
	}

	override function get(from: Int): Dynamic {
		var index: Int = inputs[0].get();

		if (index == null) return null;

		var gamepad = Input.getGamepad(index);

		return switch (property0) {
			default: false;
			case "started": gamepad.started(property1);
			case "down": gamepad.down(property1) > 0.0;
			case "released": gamepad.released(property1);
		}
	}
}
