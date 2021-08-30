 package armory.logicnode;

import iron.object.Object;
import armory.trait.physics.RigidBody;

class RemoveRigidBodyNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var object: Object = inputs[1].get();

		if (object == null) return;

		#if arm_physics
		var rb = object.getTrait(RigidBody);

		rb.remove();
		#end

		runOutput(0);
	}
}
