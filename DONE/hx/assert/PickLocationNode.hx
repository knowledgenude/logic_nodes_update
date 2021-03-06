package armory.logicnode;

import iron.math.Vec4;
import iron.object.Object;
import armory.trait.physics.RigidBody;
import armory.trait.physics.PhysicsWorld;

class PickLocationNode extends LogicNode {

	var loc = new Vec4();

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var object: Object = inputs[0].get();
		var coords: Vec4 = inputs[1].get();

		if (object == null || coords == null) return null;

		#if arm_physics
		var physics = PhysicsWorld.active;
		var b = physics.pickClosest(coords.x, coords.y);
		var rb = object.getTrait(RigidBody);

		if (rb != null && b == rb) {
			var p = physics.hitPointWorld;
			loc.set(p.x, p.y, p.z);
			return loc;
		}
		#end

		return null;
	}
}
