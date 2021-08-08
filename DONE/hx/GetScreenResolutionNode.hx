package armory.logicnode;

import kha.Display;
import kha.System;

class GetScreenResolutionNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		return switch (from) {
			default: Display.all[displayIndex].width;
			case 1: Display.all[displayIndex].height;
			case 2: System.windowWidth();
			case 3: System.windowHeight();
		}
	}
}