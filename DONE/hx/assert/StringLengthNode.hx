package armory.logicnode;

/*
This file was previously LengthStringNode.hx and was renamed to be updated
Author: BlackGoku36
Contributor(s): luboslenco
*/

class StringLengthNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var s: String = inputs[0].get();
		if (s == null) return null;

        return s.length;
	}
}
