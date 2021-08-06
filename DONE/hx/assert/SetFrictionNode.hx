package armory.logicnode;

import iron.object.Object;
#if arm_physics
import armory.trait.physics.RigidBody;
#end

class SetFrictionNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var object: Object = inputs[1].get();
		var friction = inputs[2].get();

		if (object == null) return;

		#if arm_physics
		var rb = object.getTrait(RigidBody);
		rb.setFriction(friction);
		#end

		runOutput(0);
	}
}
