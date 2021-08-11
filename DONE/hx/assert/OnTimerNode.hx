package armory.logicnode;

import iron.system.Time;

class OnTimerNode extends LogicNode {

	var duration = 0.0;
	var repeat = false;

	public function new(tree: LogicTree) {
		super(tree);

		tree.notifyOnUpdate(update);
	}

	function update() {
		if (duration <= 0.0) {
			var d: Float = inputs[0].get();
			var r: Bool = inputs[1].get();

			if (d == null || r == null) return;

			duration = inputs[0].get();
			repeat = inputs[1].get();
		}

		duration -= Time.delta;

		if (duration <= 0.0) {
			if (!repeat) tree.removeUpdate(update);
			runOutput(0);
		}
	}
}
