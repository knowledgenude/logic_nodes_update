package armory.logicnode;

import iron.math.Vec4;
import iron.math.Vec2;
import iron.system.Time;
import iron.system.Input;

class OnSwipeNode extends LogicNode {

	var point_start = new Vec2();
	var point_end = new Vec2();
	var direction = new Vec2();
	var length = 0;
	var swipe = false;
	public var time_delta = 0.0;
	public var minimal_length = 0;
	var timer = 0.0;

	public function new(tree: LogicTree) {
		super(tree);
		tree.notifyOnUpdate(update);
	}

	function update() {
		var surface = Input.getSurface();

		// Check swipe end
		if (swipe == true) {
			timer += Time.delta;

			if ((surface.released() == true) || (timer >= time_delta)) {
				swipe = false;
				point_end.x = surface.x;
				point_end.y = point_start.y; 
				point_start.y = surface.y;
				// Calc result direction
				direction.x = point_end.x - point_start.x;
				direction.y = point_end.y - point_start.y;
				// Calc length				
				length = Math.round(Math.sqrt(direction.x * direction.x + direction.y * direction.y));
				// Check minimal length
				if (length >= minimal_length) {			
					// Execute next action linked to this node
					runOutput(0);
				}
			}
		}
		// Check swipe start
		else if ((surface.started() == true)) {
			// In parameter
			if (inputs.length > 1) {
				time_delta = inputs[0].get();
				minimal_length = inputs[1].get();
			}

			point_start.x = surface.x;
			point_start.y = surface.y;
			swipe = true;
			timer = 0;
			direction.x = 0;
			direction.y = 0;
			length = 0;
		}
	}

	function getState(from: Int, dir: Vec2): Dynamic {
		if (outputs.length == 8) return getStateFor4Direction(from, dir);
		else return getStateFor8Direction(from, dir);
	}

	function getStateFor4Direction(from: Int, dir: Vec2): Null<Bool> {
		var angle = calc_angle(dir);

		return switch (from) {
			default: null;
			case 1: angle >= 45 && angle < 135; // Up
			case 2: angle >= 225 && angle < 315; // Down
			case 3: angle >= 135 && angle < 225; // Left
			case 4: angle >= 315 || angle < 45; // Right
		} 
	}

	function getStateFor8Direction(from: Int, dir: Vec2): Null<Bool> {
		var angle = calc_angle(dir);

		return switch (from) {
			default: null;
			case 1: angle >= 68 && angle < 112; // Up
			case 2: angle >= 248 && angle < 292; // Down
			case 3: angle >= 158 && angle < 202; // Left
			case 4: angle >= 338 || angle < 22; // Right
			case 5: angle >= 112 && angle < 158; // Up left
			case 6: angle >= 22 && angle < 68; // Up right
			case 7: angle >= 202 && angle < 248; // Down left
			case 8: angle >= 292 && angle < 338; // Down right
			}
		}
	}

	// Calculate angle from 0 to 360
	function calc_angle(vector: Vec2): Int {
		var ax = vector.x;
		var ay = vector.y;
		var bx = vector.x;
		var by = 0.0;
		var angle = Math.atan2(ax * by - bx * ay, ax * bx + ay * by) * 180 / Math.PI;

		// Determine the quarter
		if ((ax > 0) && (ay > 0)) {
			// I
			angle = -angle;
		} else if ((ax < 0) && (ay > 0)) {
			// II
			angle = 180.0 - angle;
		} else if ((ax < 0) && (ay < 0)) {
			// III
			angle = 180.0 - angle;
		} else if ((ax > 0) && (ay < 0)) {
			// IV
			angle = 360.0 - angle;
		}

		return Math.round(angle);
	}

	override function get(from: Int): Dynamic {
		return switch (from) {
			default: null;
			case 1: new Vec4().set(direction.x, direction.y, 0.0).normalize();
			case 2: length;
			case 3: calc_angle(direction);
			case 4: getState(from - 3, direction);
		}
	}
}