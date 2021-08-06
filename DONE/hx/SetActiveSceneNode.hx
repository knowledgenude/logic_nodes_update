package armory.logicnode;

import iron.Scene;
import iron.object.Object;

/*
This file was previously SetSceneNode.hx and was renamed to be updated
Original author: luboslenco
Contributor(s): MoritzBrueckner
*/

class SetActiveSceneNode extends LogicNode {

	var root: Null<Object>;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var sceneName: String = inputs[1].get();

		#if arm_json
		sceneName += ".json";
		#end

		Scene.setActive(sceneName, function(o: Object) {
			root = o;
			runOutput(0);
		});
	}

	override function get(from: Int): Dynamic {
		return root;
	}
}
