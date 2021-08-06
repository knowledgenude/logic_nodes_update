package armory.logicnode;

import iron.math.Vec4;
import iron.object.Object;
#if arm_physics
import armory.trait.physics.RigidBody;
#end

class ApplyImpulseNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var object: Object = inputs[1].get();
		var impulse: Vec4 = inputs[2].get();
		var local: Bool = inputs[3].get();

		if (object == null || impulse == null) return;

		#if arm_physics
		var rb: RigidBody = object.getTrait(RigidBody);

		if (local) {
			impulse.applyQuat(object.transform.rot);
		}

		rb.applyImpulse(impulse);
		#end

		runOutput(0);
	}

}
