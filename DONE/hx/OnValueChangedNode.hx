package armory.logicnode;

class OnValueChangedNode extends LogicNode {

	var initValue: Dynamic;
	var currentValue: Dynamic;
	var init = false;

	public function new(tree: LogicTree) {
		super(tree);

		tree.notifyOnUpdate(update);
	}

	function update() {
		var v: Dynamic = inputs[1].get();

		if (currentValue != v) {
			currentValue = v;
			runOutput(1); // Changed

			if (!init) {
				initialValue = v;
				runOutput(0); // Initial value changed
				init = true;
			
			} else {
				if (value == initial) {
					runOutput(2); // Unchanged
				}
			}
		}
	}

	override function get(from: Int): Dynamic {
		if (from == 0) return initialValue;
		else return value;
	}
}
