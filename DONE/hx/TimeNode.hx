package armory.logicnode;

import iron.system.Time;

class TimeNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		if (from == 0) return Time.time();
		else return Time.delta;
	}
}
