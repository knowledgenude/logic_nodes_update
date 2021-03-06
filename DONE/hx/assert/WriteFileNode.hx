package armory.logicnode;

import haxe.io.Bytes;

class WriteFileNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		// Relative or absolute path to file
		var file: String = inputs[1].get();
		var data: String = inputs[2].get();

		if (file == null) return;

		#if kha_krom
		var path = Krom.getFilesLocation() + "/" + file;
		var bytes = Bytes.ofString(data);
		Krom.fileSaveBytes(path, bytes.getData());
		#end
	}
}
