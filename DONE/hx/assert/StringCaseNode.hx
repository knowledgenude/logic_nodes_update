package armory.logicnode;

/*
This file was previously CaseStringNode.hx and was renamed to be updated
Original author: BlackGoku36
Contributor(s): luboslenco
*/

class StringCaseNode extends LogicNode {

	public var property0: String;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var s: String = inputs[0].get();

		if (s == null) return null;

		return switch (property0) {
			default: null;
			case "upper case": s.toUpperCase();
			case "lower case": s.toLowerCase();
		}
	}
}
