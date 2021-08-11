package armory.logicnode;

class IsNullNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var value: Dynamic = inputs[1].get();

		if (value == null) runOutput(0);
		else runOutput(1);
	}
}
