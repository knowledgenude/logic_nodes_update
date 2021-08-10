package armory.logicnode;

import iron.system.Time;

// This file was previously TimeNode.hx and was renamed to be updated
// Original author: luboslenco

class GetTimeNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		return switch (from) {
			default: null;
			case 0: Time.time();
			case 1: Time.delta;
			case 2: Time.realDelta;
		}
	}
}
