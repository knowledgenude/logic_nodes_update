package armory.logicnode;

import iron.math.Vec4;
import iron.object.Object;

class ConvertVectorNode extends LogicNode {

	public var property0: String;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Vec4 {
		var object: Object = inputs[0].get();
		var vecIn: Vec4 = inputs[1].get();
		var locInfluence: Vec4 = inputs[2].get();

		if (object == null || vec == null) return null;

		var vecOut = new Vec4();

		if (property0 == "to local space") {
			if (locInfluence) vecOut.sub(object.transform.world.getLoc());

			vecOut.x = vecIn.dot(object.transform.right());
			vecOut.y = vecIn.dot(object.transform.look());
			vecOut.z = vecIn.dot(object.transform.up());
		
		} else {
			vecOut.setFrom(vecIn).applyQuat(object.transform.rot);

			if (locInfluence) vecOut.add(object.transform.world.getLoc());
		}

		return vecOut;
	}
}
