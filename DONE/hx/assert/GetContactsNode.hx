package armory.logicnode;

import iron.object.Object;
import armory.trait.physics.RigidBody;
import armory.trait.physics.PhysicsWorld;

class GetContactsNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var object: Object = inputs[0].get();

		if (object == null) return null;

		#if arm_physics
		var physics = PhysicsWorld.active;
		var rbs = physics.getContacts(object.getTrait(RigidBody));
		var obs = [];

		if (rbs != null) {
			for (rb in rbs) {
				if (rb != null) obs.push(rb.object);
			}
		}

		return obs;
		#end

		return null;
	}
}
