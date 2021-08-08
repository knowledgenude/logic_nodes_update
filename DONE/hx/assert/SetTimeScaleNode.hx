package armory.logicnode;

import iron.system.Time;

class SetTimeScaleNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var f: Float = inputs[1].get();

		if (f == null) return;

		Time.scale = f;
		runOutput(0);
	}
}
