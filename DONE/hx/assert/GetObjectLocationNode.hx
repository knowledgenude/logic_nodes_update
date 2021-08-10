package armory.logicnode;

import iron.object.Object;

// This file was previously GetLocationNode.hx and was renamed to be updated
// Original author: luboslenco

class GetObjectLocationNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var object: Object = inputs[0].get();
		var relative: Bool = inputs[1].get();

		if (object == null) return null;

		var loc = object.transform.world.getLoc();

		if (relative && object.parent != null) {
			loc.sub(object.parent.transform.world.getLoc()); // Add parent location influence

			// Convert loc to parent local space
			var dotX = loc.dot(object.parent.transform.right());
			var dotY = loc.dot(object.parent.transform.look());
			var dotZ = loc.dot(object.parent.transform.up());
			loc.set(dotX, dotY, dotZ);
		}

		return loc;
	}
}
