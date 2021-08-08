package armory.logicnode;

import kha.System;

class ShutdownNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		System.stop();
	}
}
