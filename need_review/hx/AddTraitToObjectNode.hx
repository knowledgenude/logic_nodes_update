package armory.logicnode;

import iron.object.Object;

class AddTraitToObjectNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var object: Object = inputs[1].get();
		var trait: Dynamic = inputs[2].get(); // Specify type

		object.addTrait(trait); // Verify if object already has that trait before add it
		runOutput(0); // Run output if trait is really added and doesn't exists yet
	}
}
