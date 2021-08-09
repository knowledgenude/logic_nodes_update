package armory.logicnode;

import iron.system.Input;

class OnSurfaceNode extends LogicNode {

	public var property0: String;

	public function new(tree: LogicTree) {
		super(tree);

		tree.notifyOnUpdate(update);
	}

	function update() {
		var surface = Input.getSurface();

		var b = false;
		switch (property0) {
			case "started": b = surface.started();
			case "down": b = surface.down();
			case "released": b = surface.released();
			case "moved": b = surface.moved;
		}

		if (b) runOutput(0);
	}

	override function get(from: Int): Dynamic {
		var surface = Input.getSurface();

		return switch (property0) {
			default: false;
			case "started": surface.started();
			case "down": surface.down();
			case "released": surface.released();
			case "moved": surface.moved;
		}
	}
}
