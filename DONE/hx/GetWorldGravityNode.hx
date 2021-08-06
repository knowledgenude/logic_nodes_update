package armory.logicnode;

#if arm_physics
import armory.trait.physics.PhysicsWorld;
#end

/*
This file was previously GetGravityNode.hx and was renamed to be updated
Original author: anadin
Contributor(s): luboslenco, QuantumCoderQC
*/

class GetWorldGravityNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		#if arm_physics
		return PhysicsWorld.active.getGravity();
		#end

		return null;
	}
}
