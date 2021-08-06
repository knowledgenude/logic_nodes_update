package armory.logicnode;

import iron.object.Object;
#if arm_physics
import armory.trait.physics.RigidBody;
#end

/*
 This file was previously SetGravityEnabledNode.hx and was renamed to be updated
 Original author: zicklag
 Contributor(s): luboslenco
*/

class SetObjectGravityEnabledNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var object: Object = inputs[1].get();
		var enableGravity: Bool = inputs[2].get();

		if (object == null) return;

		#if arm_physics
		var body = object.getTrait(RigidBody);
		if (body != null) {
			if (enableGravity) {
				body.enableGravity();
			}
			else {
				body.disableGravity();
			}
		}
		#end

		runOutput(0);
	}
}
