package armory.logicnode;

// This file was previously ArrayLengthNode.hx and was renamed to be updated
// Author: luboslenco

class GetArrayLengthNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var ar: Array<Dynamic> = inputs[0].get();

		return ar != null ? ar.length : 0;
	}
}
