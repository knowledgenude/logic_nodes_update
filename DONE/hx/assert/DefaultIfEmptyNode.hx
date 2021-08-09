package armory.logicnode;

class DefaultIfEmptyNode extends LogicNode {

	public var property0: String;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var v1: Dynamic = inputs[0].get();
		var v2: Dynamic = inputs[1].get();

		return switch(property0) {
			default: null;
			case "null": v1 == null ? v2 : v1;
			case "empty string": v1 == "" ? v2 : v1;
			case "zero": v1 == 0.0 ? v2 : v1;
		}
	}

}
