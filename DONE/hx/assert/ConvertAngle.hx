package armory.logicnode;

class ConvertAngleNode extends LogicNode {

	public var property0: String;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var angle: Float = inputs[0].get();

		if (angle == null) return null;

		if (property0 == "radian to degree") angle *= 57.29578;
		else angle *= 0.0174532924;
		
		return angle;
	}
}
