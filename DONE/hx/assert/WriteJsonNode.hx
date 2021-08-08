package armory.logicnode;

import haxe.Json;
import haxe.io.Bytes;

class WriteJsonNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		// Relative or absolute path to file
		var file: String = inputs[1].get();
		var data: Dynamic = inputs[2].get();

		if (file == null) return;

		var s = Json.stringify(data);

		#if kha_krom
		var path = Krom.getFilesLocation() + "/" + file;
		var bytes = Bytes.ofString(s);
		Krom.fileSaveBytes(path, bytes.getData());
		#end
	}
}
