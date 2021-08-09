package armory.logicnode;

import iron.Scene;

class GetGroupNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var groupName: String = inputs[0].get();

		if (groupName == null) return null;

		return Scene.active.getGroup(groupName);
	}
}
