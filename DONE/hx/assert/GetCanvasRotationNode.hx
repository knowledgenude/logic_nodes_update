package armory.logicnode;

import iron.Scene;
#if arm_ui
import armory.trait.internal.CanvasScript;
#end

class GetCanvasRotationNode extends LogicNode {

	var canvas: CanvasScript;
	var element: String;
	var rad: Float;

	public function new(tree: LogicTree) {
		super(tree);
	}

	#if arm_ui
	function update() {
		if (!canvas.ready) return;
		tree.removeUpdate(update);

		var e = canvas.getElement(element);
		if (e == null) return;

		rad = e.rotation;
		runOutput(0);
	}

	override function run(from: Int) {
		element = inputs[1].get();
		canvas = Scene.active.getTrait(CanvasScript);
		if (canvas == null) canvas = Scene.active.camera.getTrait(CanvasScript);

		// Ensure canvas is ready
		tree.notifyOnUpdate(update);
		update();
	}
    override function get(from: Int): Dynamic {
		if (from == 1) return rad;
		else return 0;
	}
	#end
}
