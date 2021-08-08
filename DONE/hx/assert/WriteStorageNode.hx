package armory.logicnode;

import iron.system.Storage;

class WriteStorageNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var key: String = inputs[1].get();
		var value: Dynamic = inputs[2].get();

		var data = Storage.data;
	
		if (data == null) return;

		Reflect.setField(data, key, value);
		Storage.save();

		runOutput(0);
	}
}
