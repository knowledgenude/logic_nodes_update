package armory.logicnode;

import iron.object.Object;
import iron.math.Vec3;

class GetRotationNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var object: Object = inputs[0].get();

		if (object == null) {
			return null;
		}

		var rot = object.transform.rot;

		switch (from) {
			case 0:
				// euler angles
				return object.transform.rot.getEuler();
			case 1:
				// vector
				var sqrtW = Math.sqrt(1 - (rot.w * rot.w));
				if (sqrtW == 0) {
					return new Vec3(0, 0, 1);
				}
				return new Vec3(rot.x / sqrtW, rot.y / sqrtW, rot.z / sqrtW);
			case 2:
				// angle radians
				var angle = 2 * Math.acos(rot.w);
				return angle;
			case 3:
				// angle degrees
				var angle = 2 * Math.acos(rot.w);
				return angle * (180 / Math.PI);
			case 4:
				//quaternion xyz
				return new Vec3(rot.x, rot.y, rot.z);
			case 5:
				//quaternion w
				return rot.w;
		}
		return null;
	}
}
