package armory.logicnode;

/*
This file was previously PrintNode.hx and was renamed to be updated
Author: luboslenco
Contributor(s): greyheron
*/

class TraceNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var value: Dynamic = inputs[1].get();

		#if (arm_debug)
		trace(tree.name + ": " + value);
		#else
		trace(value);
		#end

		runOutput(0);
	}
}
