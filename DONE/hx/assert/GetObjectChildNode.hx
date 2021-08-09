package armory.logicnode;

import iron.object.Object;

/*
This file was previously GetChildNode.hx and was renamed to be updated
Original author: luboslenco
Contributor(s): QuantumCoderQC
*/

class GetObjectChildNode extends LogicNode {

	public var property0: String;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var object: Object = inputs[0].get();
		var childName: String = inputs[1].get();

		if (object == null || childName == null) return null;

		return switch (property0) {
			default: null;
			case "by name": object.getChild(childName);
			case "contains": contains(object, childName);
			case "starts with": startsWith(object, childName);
			case "ends with": endsWith(object, childName);
		}
	}

	function contains(o: Object, name: String): Object {
		for (c in o.children) {
			if (c.name.indexOf(name) >= 0) return c;
		}

		return null;
	}

	function startsWith(o: Object, name: String): Object {
		for (c in o.children) {
			if (StringTools.startsWith(c.name, name)) return c;
		}

		return null;
	}

	function endsWith(o: Object, name: String): Object {
		for (c in o.children) {
			if (StringTools.endsWith(c.name, name)) return c;
		}

		return null;
	}
}
