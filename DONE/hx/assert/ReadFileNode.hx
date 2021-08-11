package armory.logicnode;

import iron.data.Data;

class ReadFileNode extends LogicNode {

	var data: String;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		// Relative or absolute path to file
		var file: String = inputs[1].get();

		// Whether to use the cache
		var useCache: Bool = inputs[2].get();

		if (file == null || useCache == null) return;

		// Load the file asynchronously
		if (!useCache && Data.cachedBlobs.get(file) != null) Data.cachedBlobs.remove(file);

		Data.getBlob(file, function(b: kha.Blob) {
			data = b.toString();
			if (!useCache) Data.cachedBlobs.remove(file);
			runOutput(0);
		});
	}

	override function get(from: Int): Dynamic {
		return data;
	}
}
