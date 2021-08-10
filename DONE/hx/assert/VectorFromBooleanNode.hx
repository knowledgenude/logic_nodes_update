package armory.logicnode;

import iron.math.Vec4;

class VectorFromBooleanNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var boolX = inputs[0].get();
		var boolNegX = inputs[1].get();
		var boolY = inputs[2].get();
		var boolNegY = inputs[3].get();
		var boolZ = inputs[4].get();
		var boolNegZ = inputs[5].get();

		if (boolX == null || boolNegX == null || boolY == null || boolNegY == null || boolZ == null || boolNegZ == null) {
			return null;
		}

		var v = new Vec4();

		if (boolX == true) v.x += 1.0;
		if (boolNegX == true) v.x -= 1.0;
		if (boolY == true) v.y += 1.0;
		if (boolNegY == true) v.y -= 1.0;
		if (boolZ == true) v.z += 1.0;
		if (boolNegZ == true) v.z -= 1.0;

		return vector.normalize();
	}
}
