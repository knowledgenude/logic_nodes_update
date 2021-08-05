package armory.logicnode;

import iron.Scene;

class RemoveActiveSceneNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		Scene.active.remove();

		runOutput(0);
	}
}
