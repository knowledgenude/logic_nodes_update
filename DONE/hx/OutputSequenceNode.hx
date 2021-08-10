package armory.logicnode;

// This file was previously SequenceNode.hx and was renamed to be updated
// Author: luboslenco

class OutputSequenceNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		for (i in 0...outputs.length) runOutput(i);
	}
}
