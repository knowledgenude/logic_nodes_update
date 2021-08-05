package armory.logicnode;

import iron.Scene;

class GetActiveCameraNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		return Scene.active.camera;
	}
}