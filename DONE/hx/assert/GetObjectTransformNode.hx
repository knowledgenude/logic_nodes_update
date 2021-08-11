package armory.logicnode;

import iron.object.Object;

// This file was previously GetTransformNode.hx and was renamed to be updated
// Author: luboslenco

class GetObjectTransformNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var object: Object = inputs[0].get();

		if (object == null) return null;

		return object.transform.world;
	}
}
