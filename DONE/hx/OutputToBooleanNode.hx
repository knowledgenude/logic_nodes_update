package armory.logicnode;

// This file was previously ToBoolNode.hx and was renamed to be updated
// Author: luboslenco

class OutputToBooleanNode extends LogicNode {

	var value: Bool;
	var b = false;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		b = true;
	}

	override function get(from: Int): Dynamic {
		value = b;
		b = false;

		return value;
	}
}
