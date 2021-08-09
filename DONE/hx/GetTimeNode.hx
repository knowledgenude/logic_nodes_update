package armory.logicnode;

import iron.system.Time;

// This file was previously TimeNode.hx and was renamed to be updated
// Original author: luboslenco

class GetTimeNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		if (from == 0) return Time.time();
		else if (from == 1) return Time.delta;
		else return Time.realDelta;
	}
}
