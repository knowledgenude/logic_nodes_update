package armory.logicnode;

import iron.math.Vec4;
import iron.object.Object;
#if arm_physics
import armory.trait.physics.RigidBody;
#end

class ApplyImpulseAtLocationNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var object: Object = inputs[1].get();
		var impulse: Vec4 = inputs[2].get();
		var localImpulse: Bool = inputs[3].get();
        var location: Vec4 = inputs[4].get();
		var localLoc: Bool = inputs[5].get();

		if (object == null || impulse == null || location == null) return;

		#if arm_physics
		var rb: RigidBody = object.getTrait(RigidBody);

		if (localLoc) {
			location.applyQuat(object.transform.rot);
		}

		if (localImpulse) {
			impulse.applyQuat(object.transform.rot);
		}

		rb.applyImpulse(impulse, location);
		#end

		runOutput(0);
	}

}
