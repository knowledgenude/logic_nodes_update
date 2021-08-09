package armory.logicnode;

import iron.object.Object;

//This file was previously GetChildrenNode.hx and was renamed to be updated
//Original author: luboslenco

class GetObjectChildrenNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var object: Object = inputs[0].get();

		if (object == null) return null;

		return object.children;
	}
}
