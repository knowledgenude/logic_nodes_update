package armory.logicnode;

import iron.Scene;
import iron.math.Mat4;
import iron.object.Object;

class SpawnSceneNode extends LogicNode {

	var root: Object;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {

		var sceneName: String = inputs[1].get();
		var matrix: Mat4 = inputs[2].get();

		root = Scene.active.addObject();
		root.name = sceneName;

		if (matrix != null) {
			root.transform.setMatrix(matrix);
			root.transform.buildMatrix();
		}

		Scene.active.addScene(sceneName, root, function(o: Object) {
			runOutput(0);
		});
	}

	override function get(from: Int): Dynamic {
		return root;
	}
}
