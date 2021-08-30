package armory.logicnode;

import iron.Scene;
import armory.trait.internal.CanvasScript;

class SetCanvasScaleNode extends LogicNode {

	var canvas: CanvasScript;
	var element: String;
	var height: Int;
    var width: Int;

	public function new(tree: LogicTree) {
		super(tree);
	}

	#if arm_ui
	function update() {
		if (!canvas.ready) return;
		tree.removeUpdate(update);

		var e = canvas.getElement(element);
		if (e != null) {
			e.height = height;
			e.width = width;
		}
		runOutput(0);
	}

	override function run(from: Int) {
		element = inputs[1].get();
		height = inputs[2].get();
        width = inputs[3].get();
		canvas = Scene.active.getTrait(CanvasScript);
		if (canvas == null) canvas = Scene.active.camera.getTrait(CanvasScript);

		// Ensure canvas is ready
		tree.notifyOnUpdate(update);
		update();
	}
	#end
}