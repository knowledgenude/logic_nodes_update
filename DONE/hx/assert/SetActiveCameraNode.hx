package armory.logicnode;

import iron.Scene;
import iron.object.CameraObject;

/*
 This file was previously SetCameraNode.hx and was renamed to be updated
 Original author: luboslenco
 Contributor(s): zicklag
*/

class SetActiveCameraNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var camera: CameraObject = inputs[1].get();

		if (camera == null) return;

		camera.buildProjection();

		Scene.active.camera = camera;

		runOutput(0);
	}
}
