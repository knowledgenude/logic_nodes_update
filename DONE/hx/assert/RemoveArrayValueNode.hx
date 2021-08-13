package armory.logicnode;

// This file was previously ArrayRemoveValueNode.hx and was renamed to be updated
// Author: luboslenco

class RemoveArrayValueNode extends LogicNode {

 	var removedValue: Dynamic = null;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var ar: Array<Dynamic> = inputs[1].get();
		if (ar == null) return;

		var val: Dynamic = inputs[2].get();

		removedValue = val;
		ar.remove(val);

		runOutput(0);
	}

	override function get(from: Int): Dynamic {
		return removedValue;
	}
}
