package armory.logicnode;

import iron.system.Input;

class OnKeyboardNode extends LogicNode {

	public var property0: String;
	public var property1: String;

	public function new(tree: LogicTree) {
		super(tree);

		tree.notifyOnUpdate(update);
	}

	function update() {
		var keyboard = Input.getKeyboard();

		var b = false;
		switch (property0) {
			case "started": b = keyboard.started(property1);
			case "down": b = keyboard.down(property1);
			case "released": b = keyboard.released(property1);
		}

		if (b) runOutput(0);
	}

	override function get(from: Int): Dynamic {
		var keyboard = Input.getKeyboard();

		return switch (property0) {
			default: false;
			case "started": keyboard.started(property1);
			case "down": keyboard.down(property1);
			case "released": keyboard.released(property1);
		}
	}
}
