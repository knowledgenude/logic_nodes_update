package armory.logicnode;

import armory.math.Helper;

class MapRangeNode extends LogicNode {

	public var property0: Bool; // Map clamped

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var value = inputs[0].get();
		var fromMin = inputs[1].get();
		var fromMax = inputs[2].get();
		var toMin = inputs[3].get();
		var toMax = inputs[4].get();

		if (value == null || fromMin == null || fromMax == null || toMin == null || toMax == null) return null;

		if (property0) return Helper.mapClamped(value, fromMin, fromMax, toMin, toMax);
		else return Helper.map(value, fromMin, fromMax, toMin, toMax);
	}
}
