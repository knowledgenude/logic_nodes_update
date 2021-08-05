package armory.logicnode;

import iron.Scene;
import iron.object.Object;

class PlayActionNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var object: Object = inputs[1].get();
		var action: String = inputs[2].get();
		var startFrame:Int = inputs[3].get();
		var blendTime: Float = inputs[4].get();
		var speed: Float = inputs[5].get();
		var loop: Bool = inputs[6].get();

		if (object == null) return;

		var animation = object.animation;
		if (animation == null) animation = object.getParentArmature(object.name);

		animation.play(action, function() {
			runOutput(1);
		}, blendTime, speed, loop);

		animation.update(startFrame*Scene.active.raw.frame_time);

		runOutput(0);
	}
}
