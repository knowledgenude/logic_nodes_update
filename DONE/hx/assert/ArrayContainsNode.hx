package armory.logicnode;

/*
This file was previously ArrayInArrayNode.hx and was renamed to be updated
Author: zicklag
Contributor(s): luboslenco
*/

class ArrayContainsNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var ar: Array<Dynamic> = inputs[0].get();
		if (ar == null) return null;

		var value: Dynamic = inputs[1].get();

		return ar.contains(value);
	}
}
