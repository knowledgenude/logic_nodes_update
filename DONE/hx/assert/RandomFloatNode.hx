package armory.logicnode;

class RandomFloatNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var min: Float = inputs[0].get();
		var max: Float = inputs[1].get();

		if (min == null || max == null) return null;

		return min + (Math.random() * (max - min));
	}
}
