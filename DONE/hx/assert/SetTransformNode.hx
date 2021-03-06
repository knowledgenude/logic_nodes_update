package armory.logicnode;

import iron.object.Object;
import iron.math.Mat4;
#if arm_physics
import armory.trait.physics.RigidBody;
#end

class SetTransformNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var object: Object = inputs[1].get();
		var matrix: Mat4 = inputs[2].get();

		if (object == null || matrix == null) return;

		object.transform.setMatrix(matrix);

		#if arm_physics
		var rb = object.getTrait(RigidBody);
		if (rb != null) rb.syncTransform();
		#end

		runOutput(0);
	}
}
