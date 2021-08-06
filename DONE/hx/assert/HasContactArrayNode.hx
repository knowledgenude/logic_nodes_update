package armory.logicnode;

import iron.object.Object;
#if arm_physics
import armory.trait.physics.RigidBody;
import armory.trait.physics.PhysicsWorld;
#end

class HasContactArrayNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var object1: Object = inputs[0].get();
		var objects: Array<Object> = inputs[1].get();

		if (object1 == null || objects == null) return false;

		#if arm_physics
		var rb1 = object1.getTrait(RigidBody);
		var rbs = PhysicsWorld.active.getContacts(rb1);
		
		if (rb1 != null && rbs != null) {
			for (object2 in objects) {
				var rb2 = object2.getTrait(RigidBody);

				for (rb in rbs) {
					if (rb == rb2) {
						return true;
					}
				}
			}
		}
		#end

		return false;
	}
}
