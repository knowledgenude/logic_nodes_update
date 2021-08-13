package armory.logicnode;

// This file was previously ArrayFloatNode.hx and was renamed to be updated
// Author: luboslenco

class FloatArrayNode extends LogicNode {

	public var value: Array<Float> = [];
	var initialized = false;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		if (!initialized) {
			initialized = true;
			for (inp in inputs) {
				var val: Float = inp.get();
				value.push(val);
			}
		}

		return from == 0 ? value : value.length;
	}

	override function set(value: Dynamic) {
		this.value = value;
	}
}
