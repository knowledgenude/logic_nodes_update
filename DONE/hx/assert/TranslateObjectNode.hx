package armory.logicnode;

import iron.math.Vec4;
import iron.object.Object;
#if arm_physics
import armory.trait.physics.RigidBody;
#end

class TranslateObjectNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var object: Object = inputs[1].get();
		var vec: Vec4 = inputs[2].get();
		var local: Bool = inputs[3].get();

		if (object == null || vec == null || local == null) return;

		if (local) {
			vec.applyQuat(object.transform.rot);
		}

		object.transform.loc.add(vec);

		#if arm_physics
		var rb = object.getTrait(RigidBody);
		if (rb != null) rb.syncTransform();
		#else
		object.transform.buildMatrix();
		#end

		runOutput(0);
	}

}
