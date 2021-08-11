package armory.logicnode;

import iron.object.MeshObject;

// This file was previously GetMeshNode.hx and was renamed to be updated
// Author: luboslenco

class GetObjectMeshNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var object: MeshObject = inputs[0].get();

		if (object == null) return null;

		return object.data;
	}
}
