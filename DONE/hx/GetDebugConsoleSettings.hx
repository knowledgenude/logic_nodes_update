package armory.logicnode;

import armory.trait.internal.DebugConsole;

class GetDebugConsoleSettings extends LogicNode {
   
	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		#if arm_debug
		return switch(from) {
			case 0: DebugConsole.getVisible();
			case 1: DebugConsole.getScale();
			case 2: {
				switch (DebugConsole.getPosition()) {
					case PositionStateEnum.LEFT: "Left";
					case PositionStateEnum.CENTER: "Center";
					case PositionStateEnum.RIGHT: "Right";
				}
			}
		}
		#end

		return null;
	}
}
