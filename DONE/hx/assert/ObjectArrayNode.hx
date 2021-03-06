package armory.logicnode;

import iron.object.Object;

// This file was previously ArrayObjectNode.hx and was renamed to be updated
// Author: luboslenco

class ObjectArrayNode extends LogicNode {

	public var value: Array<Object> = [];
	var initialized = false;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		if (!initialized) {
			initialized = true;
			for (inp in inputs) {
				var val: Object = inp.get();
				value.push(val);
			}
		}

		return from == 0 ? value : value.length;
	}

	override function set(value: Dynamic) {
		this.value = value;
	}
}
