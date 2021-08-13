package armory.logicnode;

// This file was previously ArrayRemoveNode.hx and was renamed to be updated
// Author: luboslenco

class RemoveArrayIndexNode extends LogicNode {

 	var removedValue: Dynamic = null;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var ar: Array<Dynamic> = inputs[1].get();
		var i: Int = inputs[2].get();

		if (ar == null || i == null) return;

		if (i < 0) i = ar.length + i;

		removedValue = ar[i];
		ar.splice(i, 1);

		runOutput(0);
	}

	override function get(from: Int): Dynamic {
		return removedValue;
	}
}
