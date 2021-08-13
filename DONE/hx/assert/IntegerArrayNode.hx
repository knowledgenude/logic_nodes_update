package armory.logicnode;

// This file was previously ArrayIntegerNode.hx and was renamed to be updated
// Author: luboslenco

class IntegerArrayNode extends LogicNode {

	public var value: Array<Int> = [];
	var initialized = false;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		if (!initialized) {
			initialized = true;
			for (inp in inputs) {
				var val: Int = inp.get();
				value.push(val);
			}
		}

		return from == 0 ? value : value.length;
	}

	override function set(value: Dynamic) {
		this.value = value;
	}
}
