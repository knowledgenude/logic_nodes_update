package armory.logicnode;

import iron.system.Input;

class OnVirtualButtonNode extends LogicNode {

	public var property0: String;
	public var property1: String;

	public function new(tree: LogicTree) {
		super(tree);

		tree.notifyOnUpdate(update);
	}

	function update() {
		var vb = Input.getVirtualButton(property1);

		if (vb == null) return;

		var b = false;
		switch (property0) {
			case "started": b = vb.started;
			case "down": b = vb.down;
			case "released": b = vb.released;
		}

		if (b) runOutput(0);
	}

	override function get(from: Int): Dynamic {
		var vb = Input.getVirtualButton(property1);

		if (vb == null) return false;

		return switch (property0) {
			default: false;
			case "started": vb.started;
			case "down": vb.down;
			case "released": vb.released;
		}
	}
}
