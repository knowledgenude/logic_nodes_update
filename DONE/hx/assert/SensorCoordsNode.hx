package armory.logicnode;

import iron.math.Vec4;
import iron.system.Input;

class SensorCoordsNode extends LogicNode {

	var coords = new Vec4();

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var sensor = Input.getSensor();

		return coords.set(sensor.x, sensor.y, sensor.z);
	}
}
