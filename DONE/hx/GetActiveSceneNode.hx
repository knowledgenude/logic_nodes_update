package armory.logicnode;

import iron.Scene;

class GetActiveSceneNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		return Scene.active.raw.name;
	}
}
