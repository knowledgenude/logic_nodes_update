package armory.logicnode;

class LoopNode extends LogicNode {

	var index: Int;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var from: Int = inputs[1].get();
		var to: Int = inputs[2].get();

		if (from == null || to == null) return;

		index = 0;

		for (i in from...to) {
			index = i;

			runOutput(0);

			if (tree.loopBreak) {
				tree.loopBreak = false;
				break;
			}
		}

		runOutput(2);
	}

	override function get(from: Int): Dynamic {
		return index;
	}
}
