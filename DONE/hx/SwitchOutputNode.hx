package armory.logicnode;

/*
This file was previously SwitchNode.hx and was renamed to be updated
Author: Devination
Contributor(s): luboslenco
*/

class SwitchOutputNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var v1: Dynamic = inputs[1].get();

		if (inputs.length > 2) {
			for (i in 2...inputs.length) {
				if (inputs[i].get() == v1) {
					runOutput(i - 1);
					return;
				}
			}
		}

		runOutput(0);
	}
}
