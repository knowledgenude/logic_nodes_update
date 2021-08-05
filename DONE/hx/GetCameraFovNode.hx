package armory.logicnode;

import iron.object.CameraObject;

class GetCameraFovNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var camera: CameraObject = inputs[0].get();

		return camera.data.raw.fov;
	}
}
