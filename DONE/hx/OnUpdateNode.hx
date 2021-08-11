package armory.logicnode;

#if arm_physics
import armory.trait.physics.PhysicsWorld;
#end

class OnUpdateNode extends LogicNode {

	public var property0: String; // Update, Late Update, Physics Pre-Update

	public function new(tree: LogicTree) {
		super(tree);
		tree.notifyOnInit(init);
	}

	function init() {
		switch (property0) {
			default: tree.notifyOnUpdate(update);
			case "late update": tree.notifyOnLateUpdate(update);
			#if arm_physics
			case "physics pre-update": PhysicsWorld.active.notifyOnPreUpdate(update);
			#end
		}
	}

	function update() {
		runOutput(0);
	}
}
