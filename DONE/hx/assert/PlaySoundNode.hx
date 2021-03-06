package armory.logicnode;

import kha.Sound;
import kha.audio1.AudioChannel;
import iron.data.Data;
import iron.system.Audio;

// This file was previously PlaySoundRawNode.hx and was renamed to be updated
// Author: MoritzBrueckner

class PlaySoundNode extends LogicNode {

	/** The name of the sound */
	public var property0: String;
	/** Whether to loop the playback */
	public var property1: Bool;
	/** Retrigger */
	public var property2: Bool;
	/** Override sample rate */
	public var property3: Bool;
	/** Playback sample rate */
	public var property4: Int;
	/** Whether to stream the sound from disk **/
	public var property5: Bool;

	var sound: Sound = null;
	var channel: AudioChannel = null;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		switch (from) {
			case Play:
				if (sound == null) {
					Data.getSound(property0, function(s: Sound) {
						this.sound = s;
					});
				}

				// Resume
				if (channel != null) {
					if (property2) channel.stop();
					channel.play();
				}
				// Start
				else if (sound != null) {
					if (property3) sound.sampleRate = property4;
					channel = Audio.play(sound, property1, property5);
				}

				tree.notifyOnUpdate(this.onUpdate);
				runOutput(0);

			case Pause:
				if (channel != null) channel.pause();
				tree.removeUpdate(this.onUpdate);

			case Stop:
				if (channel != null) channel.stop();
				tree.removeUpdate(this.onUpdate);
				runOutput(2);
		}
	}

	function onUpdate() {
		if (channel != null) {
			// Done
			if (channel.finished) {
				channel = null;
				runOutput(2);
			}
			// Running
			else runOutput(1);
		}
	}
}

private enum abstract PlayState(Int) from Int to Int {
	var Play = 0;
	var Pause = 1;
	var Stop = 2;
}
