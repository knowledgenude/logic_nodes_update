package armory.logicnode;

import iron.math.Vec4;
import iron.object.Object;
#if arm_physics
import armory.trait.physics.RigidBody;
#end

class ApplyForceAtLocationNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var object: Object = inputs[1].get();
		var force: Vec4 = inputs[2].get();
		var localForce: Bool = inputs[3].get();
        var location: Vec4 = inputs[4].get();
		var localLoc: Bool = inputs[5].get();

		if (object == null || force == null || location == null) return;

		#if arm_physics
		var rb: RigidBody = object.getTrait(RigidBody);

		if (localLoc) {
			location.applyQuat(object.transform.rot);
		}

		if (localForce) {
			force.applyQuat(object.transform.rot);
		}

		rb.applyForce(force, location);
		#end

		runOutput(0);
	}

}
