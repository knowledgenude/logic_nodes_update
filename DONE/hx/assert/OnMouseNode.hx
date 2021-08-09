package armory.logicnode;

import iron.system.Input;

class OnMouseNode extends LogicNode {

	public var property0: String;
	public var property1: String;

	public function new(tree: LogicTree) {
		super(tree);

		tree.notifyOnUpdate(update);
	}

	function update() {
		var mouse = Input.getMouse();

		var b = false;
		switch (property0) {
			case "started": b = mouse.started(property1);
			case "down": b = mouse.down(property1);
			case "released": b = mouse.released(property1);
			case "moved": b = mouse.moved;
		}

		if (b) runOutput(0);
	}

	override function get(from: Int): Dynamic {
		var mouse = Input.getMouse();

		return switch (property0) {
			default: false;
			case "started": mouse.started(property1);
			case "down": mouse.down(property1);
			case "released": mouse.released(property1);
			case "moved": mouse.moved;
		}
	}
}
