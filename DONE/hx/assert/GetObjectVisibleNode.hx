package armory.logicnode;

import iron.object.Object;

// This file was previously GetVisibleNode.hx and was renamed to be updated
// Original author: luboslenco

class GetObjectVisibleNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var object: Object = inputs[0].get();

		if (object == null) return null;

		return switch (from) {
			default: null;
			case 0: object.visible;
			case 1: object.visibleMesh;
			case 2: object.visibleShadow;
		}

	}
}
