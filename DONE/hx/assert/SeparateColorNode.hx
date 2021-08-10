package armory.logicnode;

import iron.math.Vec4;

class SeparateColorNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var color: Vec4 = inputs[0].get();

		if (color == null) return 0.0;

		if (from == 0) return color.x;
		else if (from == 1) return color.y;
		else return color.z;
	}
}
