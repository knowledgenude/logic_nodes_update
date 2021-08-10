package armory.logicnode;

// This file was previously ContainsStringNode.hx and was renamed to be updated
// Author: luboslenco

class StringContainsNode extends LogicNode {

	public var property0: String;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var s1: String = inputs[0].get();
		var s2: String = inputs[1].get();

		if (s1 == null || s2 == null) return null;

		return switch (property0) {
			default: null;
			case "contains": s1.indexOf(s2) >= 0;
			case "starts with": StringTools.startsWith(s1, s2);
			case "ends with": StringTools.endsWith(s1, s2);
		}
	}
}
