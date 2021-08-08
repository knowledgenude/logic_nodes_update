package armory.logicnode;

import iron.Scene;
import iron.data.Data;
import iron.data.MeshData;

class MeshNode extends LogicNode {

	public var property0: String;
	public var value: MeshData = null;

	public function new(tree: LogicTree) {
		super(tree);

		Scene.active.notifyOnInit(function() {
			get(0);
		});
	}

	override function get(from: Int): Dynamic {
		Data.getMesh("mesh_" + property0, property0, function(mesh: MeshData) {
			value = mesh;
		});

		return value;
	}

	override function set(value: Dynamic) {
		this.value = value;
	}
}
