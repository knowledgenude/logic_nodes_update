package armory.logicnode;

import iron.math.Vec4;
import armory.trait.physics.PhysicsWorld;

class RayCastNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var from: Vec4 = inputs[0].get();
		var to: Vec4 = inputs[1].get();
		var mask: Int = inputs[2].get();

		#if arm_physics
		var hit = PhsyicsWorld.active.rayCast(from, to, mask);

		if (hit != null) {
			return switch(from) {
				case 0: hit.rb;
				case 1: hit.pos;
				case 2: hit.normal;
			}
		}
		#end

		return null;
	}
}
