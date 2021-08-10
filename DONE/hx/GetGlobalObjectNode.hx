package armory.logicnode;

import iron.Scene;

// This file was previously GlobalObjectNode.hx and was renamed to be updated
// Author: luboslenco

class GetGlobalObjectNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		return Scene.global;
	}
}
