package armory.logicnode;

// This file was previously AlternateNode.hx and was renamed to be updated
// Original author: luboslenco

class AlternateOutputNode extends LogicNode {

	var b = true;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		b ? runOutput(0) : runOutput(1);
		b = !b;
	}
}
