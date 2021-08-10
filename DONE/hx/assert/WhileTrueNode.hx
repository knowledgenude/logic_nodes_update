package armory.logicnode;

// This file was previously WhileNode.hx and was renamed to be updated
// Author: luboslenco

class WhileTrueNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var b: Bool = inputs[1].get();

		if (b == null) return;

		while (b) {
			runOutput(0);
			b = inputs[1].get();

			if (tree.loopBreak) {
				tree.loopBreak = false;
				break;
			}
		}

		runOutput(1);
	}
}
