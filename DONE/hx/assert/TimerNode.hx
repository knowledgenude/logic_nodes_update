package armory.logicnode;

import iron.system.Time;

class TimerNode extends LogicNode {

	var time = 0.0;
	var duration = 0.0;
	var repeat = 0;
	var running = false;
	var repetitions = 0;

	public function new(tree: LogicTree) {
		super(tree);
	}

	function update() {
		time += Time.delta;

		if (time >= duration) {
			repeat--;
			runOutput(0);

			if (repeat != 0) {
				time = 0;
				repetitions++;
			}
			else {
				removeUpdate();
				runOutput(1);
				time = 0;
				repetitions = 0;
			}
		}
	}

	override function run(from: Int) {
		if (from == 0) { // Start
			duration = inputs[3].get();
			repeat = inputs[4].get();

			if (!running) {
				running = true;
				tree.notifyOnUpdate(update);
			}
		}
		else if (from == 1) { // Pause
			removeUpdate();
		}
		else { // Stop
			removeUpdate();
			time = 0;
			repetitions = 0;
		}
	}

	inline function removeUpdate() {
		if (!running) return;

		running = false;
		tree.removeUpdate(update);
	}

	override function get(from: Int): Dynamic {
		return switch (from) {
			default: null;
			case 2: running;
			case 3: time;
			case 4: duration - time;
			case 5: time > 0.0 ? time / duration : 0.0;
			case 6: repetitions;
		}
	}
}
