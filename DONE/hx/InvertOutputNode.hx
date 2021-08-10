package armory.logicnode;

// This file was previously InverseNode.hx and was renamed to be updated
// Author: luboslenco

class InvertOutputNode extends LogicNode {

	var c = false;

	public function new(tree: LogicTree) {
		super(tree);
		tree.notifyOnUpdate(update);
	}

	override function run(from: Int) {
		c = true;
	}

	function update() {
		if (!c) runOutput(0);

		c = false;
	}
}
