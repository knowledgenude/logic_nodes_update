package armory.logicnode;

import iron.object.Object;
#if arm_physics
import armory.trait.physics.RigidBody;
#end

class GetRigidBodyDataNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var object: Object = inputs[0].get();

		if (object == null) return null;

		#if arm_physics
		var rb = object.getTrait(RigidBody);

		if (rb == null) return null;

		return switch (from) {
			default: null;
			case 0: rb.group;
			case 1: rb.mask;
			case 2: rb.animated;
			case 3: rb.staticObj;
			case 4: rb.angularDamping;
			case 5: rb.linearDamping;
			case 6: rb.friction;
			case 7: rb.mass;
			//case 8: ; // collision shape
			//case 9: ; // activation state
			//case 10: ; // is gravity enabled
			//case 11: ; // angular factor
			//case 12: ; // linear factor
		}
		#end

		return null;
	}
}
