package armory.logicnode;

import armory.trait.internal.DebugConsole;

class SetDebugConsoleSettings extends LogicNode {
   
    public var property0: String;

	public function new(tree: LogicTree) {
		super(tree);
	}

    override function run(from: Int) {
		#if arm_debug
		var visible: Dynamic = inputs[1].get();
		DebugConsole.setVisible(visible);

		var scale: Dynamic = inputs[2].get();
		if ((scale >= 0.3) && (scale <= 10.0)) DebugConsole.setScale(scale);

		switch (property0) {
			case "left": DebugConsole.setPosition(PositionStateEnum.LEFT);
			case "center": DebugConsole.setPosition(PositionStateEnum.CENTER);
			case "right": DebugConsole.setPosition(PositionStateEnum.RIGHT);
		}
		#end

		runOutput(0);
	}
}
