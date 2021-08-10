package armory.logicnode;

import iron.system.Input;

class SetCursorStateNode extends LogicNode {

	public var property0: String;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var state: Bool = inputs[1].get();
		var mouse = Input.getMouse();

		switch (property0) {
			case "hide locked": {
				if (state) {
					mouse.hide();
					mouse.lock();
				
				} else {
					mouse.show();
					mouse.unlock();
				}
			}

			case "hide": state ? mouse.hide() : mouse.show();
			case "lock": state ? mouse.lock() : mouse.unlock();
		}

		runOutput(0);
	}
}
