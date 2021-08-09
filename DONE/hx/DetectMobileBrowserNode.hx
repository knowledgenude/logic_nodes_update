package armory.logicnode;

import kha.SystemImpl;

class DetectMobileBrowserNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int) {
		#if kha_html5
		return SystemImpl.mobile;
		#else
		return false;
		#end
	}
}