package armory.logicnode;

import iron.Scene;
import armory.trait.internal.CanvasScript;

class SetCanvasLocationNode extends LogicNode {

	var canvas: CanvasScript;
	var element: String;
	var newX: Float;
	var newY: Float;

	public function new(tree: LogicTree) {
		super(tree);
	}

	#if arm_ui
	function update() {
		if (!canvas.ready) return;
		tree.removeUpdate(update);

		var e = canvas.getElement(element);
		if (e != null) {
			e.x = newX;
			e.y = newY;
		}
		runOutput(0);
	}

	override function run(from: Int) {
		element = inputs[1].get();
		newX = inputs[2].get();
		newY = inputs[3].get();
		canvas = Scene.active.getTrait(CanvasScript);
		if (canvas == null) canvas = Scene.active.camera.getTrait(CanvasScript);

		// Ensure canvas is ready
		tree.notifyOnUpdate(update);
		update();
	}
	#end
}
