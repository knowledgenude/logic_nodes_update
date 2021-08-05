package armory.logicnode;

import iron.Scene;
import iron.object.CameraObject;

class SetActiveCameraNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var camera: CameraObject = inputs[1].get();
		camera.buildProjection();

		Scene.active.camera = camera;

		runOutput(0);
	}
}
