package armory.logicnode;

import iron.Scene;
import iron.object.Object;
#if arm_physics
import armory.trait.physics.RigidBody;
#end

class RemoveObjectParentNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var object: Object = inputs[1].get();
		var keepTransform: Bool = inputs[2].get();

		if (object == null || object.parent == null) return;

		object.parent.removeChild(object, keepTransform);

		#if arm_physics
		var rigidBody = object.getTrait(RigidBody);
		if (rigidBody != null) rigidBody.syncTransform();
		#end

		Scene.active.root.addChild(object, false);

		runOutput(0);
	}
}
