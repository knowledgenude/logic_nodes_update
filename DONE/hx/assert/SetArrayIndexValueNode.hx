package armory.logicnode;

// This file was previously ArraySetNode.hx and was renamed to be updated
// Author: luboslenco

class SetArrayIndexNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var ar: Array<Dynamic> = inputs[1].get();
		if (ar == null) return;

		var i: Int = inputs[2].get();
		var value: Dynamic = inputs[3].get();

		if (i < 0) ar[ar.length + i] = value;
		else ar[i] = value;

		runOutput(0);
	}
}
