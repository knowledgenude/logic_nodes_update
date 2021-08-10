package armory.logicnode;

// This file was previously SelfNode.hx and was renamed to be updated
// Author: luboslenco

class SelfObjectNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		return tree.object;
	}
}
