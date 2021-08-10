package armory.logicnode;

import iron.math.Vec4;
import iron.object.Object;

// This file was previously GetWorldNode.hx and was renamed to be updated
// Original author: Sandy10000

class GetWorldTransformNode extends LogicNode {

	public var property0: String;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var object: Object = inputs[0].get();

		if (object == null) return null;

		return switch (property0) {
			default: null;
			case "right": object.transform.world.right();
			case "look": object.transform.world.look();
			case "up": object.transform.world.up();
			case "left": object.transform.right().mult(-1.0);
			case "back": object.transform.look().mult(-1.0);
			case "down": object.transform.down().mult(-1.0);
		}
	}
}
