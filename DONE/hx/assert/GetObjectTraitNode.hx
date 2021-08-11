package armory.logicnode;

import iron.Trait;
import iron.object.Object;

// This file was previously GetTraitNode.hx and was renamed to be updated
// Author: luboslenco

class GetObjectTraitNode extends LogicNode {

	var cname: Class<Trait> = null;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var object: Object = inputs[0].get();
		var name: String = inputs[1].get();

		if (object == null) return null;
		if (cname == null) cname = cast Type.resolveClass(Main.projectPackage + "." + name);
		if (cname == null) cname = cast Type.resolveClass(Main.projectPackage + ".node." + name);

		return object.getTrait(cname);
	}
}
