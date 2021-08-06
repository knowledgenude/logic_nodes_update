package armory.logicnode;

import iron.object.Object;
#if arm_physics
import armory.trait.physics.RigidBody;
#end

class SetObjectActivationStateNode extends LogicNode {

	public var property0: String;
	public var state: Int;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var object: Object = inputs[1].get();

		if (object == null) return;

		#if arm_physics
		var rb = object.getTrait(RigidBody);

		switch (property0) {
			case "inactive": state = 0; // Inactive Tag
			case "active": state = 1; // Active Tag
			case "always active": state = 4 ; // Disable Deactivation
			case "always inactive": state = 5; // Disable Simulation
		}

		rb.setActivationState(state);
		#end

		runOutput(0);
	}
}
