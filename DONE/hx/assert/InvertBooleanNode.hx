package armory.logicnode;

class InvertBooleanNode extends LogicNode {

	public var property0: String;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var v1: Bool = inputs[0].get();

		if (v1 == null) return null;

		return !v1;
	}
}
