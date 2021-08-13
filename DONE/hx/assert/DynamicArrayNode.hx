package armory.logicnode;

// This file was previously DynamicArrayNode.hx and was renamed to be updated
// Author: luboslenco

class DynamicArrayNode extends LogicNode {

	public var value: Array<Dynamic> = [];
	var initialized = false;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		if (!initialized) {
			initialized = true;
			for (inp in inputs) {
				var val: Dynamic = inp.get();
				value.push(val);
			}
		}

		return from == 0 ? value : value.length;
	}

	override function set(value: Dynamic) {
		this.value = value;
	}
}
