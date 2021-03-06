package armory.logicnode;

import iron.math.Vec4;
import iron.system.Time;
import iron.system.Input;

class OnTapScreen extends LogicNode {
   
	var duration = 0.3;
	var interval = 0.0;
    var repeat = 2;

    var timer_run = false;
	var timer_duration = 0.0;
    var timer_interval = 0.0;
    var count_taps = 0;
    var coords_last_tap = new Vec4();

	public function new(tree: LogicTree) {
		super(tree);
		tree.notifyOnUpdate(update);
	}

    function clear_var() {
        timer_run = false;
        count_taps = 0;
        timer_duration = 0.0;
        timer_interval = 0.0;
    }

    function save_vector_coord(x: Float, y: Float) {
        coords_last_tap.x = x;
		coords_last_tap.y = y;
    }

	function update() {
		var surface = Input.getSurface();

        if (surface.started() == true) {
		    duration = inputs[0].get();
		    interval = inputs[1].get();
            repeat = inputs[2].get();
        }

        if ((repeat <= 0) || (duration <= 0)) {
            clear_var();
            return;
        }

        if (timer_run == true) {
            timer_duration += Time.delta;
            if (interval > 0) timer_interval += Time.delta;
        }
        // First Tap, start timer
        if ((surface.started() == true) && (count_taps == 0)) {
            clear_var();
            count_taps += 1;
            save_vector_coord(surface.x, surface.y);
            runOutput(2); // Action tap
            timer_run = true;
        } else {
            // Next Taps
            if ((surface.started() == true) && (timer_duration < duration)) {
                if (interval > 0) {
                    if (timer_interval >= interval) {
                        count_taps += 1;
                        save_vector_coord(surface.x, surface.y);
                        runOutput(2); // Action tap
                        timer_interval = 0;
                    }
                } else {
                    count_taps += 1;
                    save_vector_coord(surface.x, surface.y);
                    runOutput(2); // Action tap
                }
            }
            // Time passed
            if (timer_duration >= duration) {
                // Taps completed
                if (count_taps >= repeat) {
                    save_vector_coord(surface.x, surface.y);
                    runOutput(0); // Action done
                    return;
                }
                clear_var();
                runOutput(1); // Action fail
            } else if (count_taps >= repeat) {
                // Taps completed
                save_vector_coord(surface.x, surface.y);
                runOutput(0); // Action done
                clear_var();
            }
        }	
	}

	override function get(from: Int): Dynamic {
		switch (from) {
			case 3: return count_taps;
			case 4: return coords_last_tap;
		}

		return null;
	}
}