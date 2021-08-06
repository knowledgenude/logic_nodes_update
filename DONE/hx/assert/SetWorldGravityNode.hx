package armory.logicnode;

import iron.math.Vec4;
#if arm_physics
import armory.trait.physics.PhysicsWorld;
#end

/*
This file was previously SetGravityNode.hx and was renamed to be updated
Original author: anadin
Contributor(s): luboslenco, QuantumCoderQC
*/

class SetWorldGravityNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var gravity: Vec4 = inputs[1].get();

		if (gravity == null) return;

		#if arm_physics
		PhysicsWorld.active.setGravity(gravity);
		#end

		runOutput(0);
	}
}
