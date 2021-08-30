package armory.logicnode;

import iron.math.Vec4;
import iron.object.Object;
import armory.trait.physics.RigidBody;

class ApplyForceNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var object: Object = inputs[1].get();
		var force: Vec4 = inputs[2].get();
		var local: Bool = inputs[3].get();

		if (object == null || force == null) return;

		#if arm_physics
		var rb: RigidBody = object.getTrait(RigidBody);

		if (local) {
			force.applyQuat(object.transform.rot);
		}

		rb.applyForce(force);
		#end

		runOutput(0);
	}

}
