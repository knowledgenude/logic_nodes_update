package armory.logicnode;

import kha.FastFloat;
import iron.math.Vec4;

/*
This file was previously VectorClampToSizeNode.hx and was renamed to be updated
Author: anadin
Contributor(s): luboslenco
*/

class VectorClampNode extends LogicNode {

	var v = new Vec4();

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var vec: Vec4 = inputs[0].get();
		var fmin: FastFloat = inputs[1].get();
		var fmax: FastFloat = inputs[2].get();

		if (vec == null) return null;

		v.setFrom(vec);
		v.clamp(fmin, fmax);

		return v;
	}
}
