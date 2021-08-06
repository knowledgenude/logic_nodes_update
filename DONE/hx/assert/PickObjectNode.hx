package armory.logicnode;

import iron.math.Vec4;
#if arm_physics
import armory.trait.physics.PhysicsWorld;
#end

class PickObjectNode extends LogicNode {

	var v = new Vec4();

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var coords: Vec4 = inputs[0].get();
		var mask: Int = inputs[1].get();

		if (coords == null) return null;

		#if arm_physics
		var physics = PhysicsWorld.active;
		var rb = physics.pickClosest(coords.x, coords.y, mask);

		if (rb == null) return null;

		if (from == 0) { // Object
			return rb.object;
		}
		else { // Hit
			return v.set(physics.hitPointWorld.x, physics.hitPointWorld.y, physics.hitPointWorld.z);
		}
		#end

		return null;
	}
}
