package armory.logicnode;

import iron.object.SpeakerObject;

// This file was previously StopSoundNode.hx and was renamed to be updated
// Author: luboslenco

class StopSpeakerNode extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var speaker: SpeakerObject = cast(inputs[1].get(), SpeakerObject);

		if (speaker == null) return;

		speaker.stop();

		runOutput(0);
	}
}
