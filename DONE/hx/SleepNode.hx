package armory.logicnode;

import iron.system.Tween;

class SleepNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var time: Float = inputs[1].get();

		Tween.timer(time, done);
	}

	function done() {
		runOutput(0);
	}
}
