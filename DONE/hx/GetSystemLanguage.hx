package armory.logicnode;

import kha.System;

class GetSystemLanguage extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		return System.language;
	}
}
