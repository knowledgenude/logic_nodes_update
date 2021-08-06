package armory.logicnode;

import iron.object.Object;
#if arm_physics
import armory.trait.physics.RigidBody;
#end

class GetVelocityNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var object: Object = inputs[0].get();
		var localLin: Bool = inputs.length > 1 ? inputs[1].get() : false;
		var localAngular: Bool = inputs.length > 2 ? inputs[2].get() : false;

		if (object == null) return null;

		#if arm_physics
		var rb: RigidBody = object.getTrait(RigidBody);

		if (from == 0) {
			var linearVel = rb.getLinearVelocity();

			if (localLinear) {
				linearVel.applyQuat(object.transform.rot);
			}

			return linearVel;

		} else {
			var angularVel = rb.getAngularVelocity();

			if (localAngular) {
				angularVel.applyQuat(object.transform.rot);
			}

			return angularVel;
		}
		#end

		return null;
	}
}
