package armory.logicnode;

import iron.Scene;

// This file was previously ActiveCameraNode.hx and was renamed to be updated
// Original author: luboslenco

class GetActiveCameraNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		return Scene.active.camera;
	}
}