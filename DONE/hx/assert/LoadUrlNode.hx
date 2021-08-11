package armory.logicnode;

import kha.System;

class LoadUrlNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var url: String = inputs[1].get();

		if (url == null) return null;

		System.loadUrl(url);
	}
}
