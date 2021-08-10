package armory.logicnode;

import iron.object.Object;

// This file was previously GetParentNode.hx and was renamed to be updated
// Original author: luboslenco

class GetObjectParentNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var object: Object = inputs[0].get();

		if (object == null) return null;

		return object.parent;
	}
}
