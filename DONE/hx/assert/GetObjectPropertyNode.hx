package armory.logicnode;

import iron.object.Object;

/*
This file was previously GetPropertyNode.hx and was renamed to be updated
Original author: luboslenco
Contributor(s): MoritzBrueckner
*/

class GetObjectPropertyNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var object: Object = inputs[0].get();
		var property: String = inputs[1].get();

		if (from == 0) {
			if (object == null || object.properties == null) return null;
			return object.properties.get(property);
		}
		else {
			return property;
		}
	}
}
