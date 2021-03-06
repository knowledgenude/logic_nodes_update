package armory.logicnode;

import kha.System;

@:access(iron.Trait)
class OnApplicationStateNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
		tree.notifyOnInit(init);
	}

	function init() {
		System.notifyOnApplicationState(
			() -> runOutput(0), // On foreground
			null, // On resume
			null, // On pause
			() -> runOutput(1), // On background
			() -> runOutput(2) // On shutdown
		);
	}
}
