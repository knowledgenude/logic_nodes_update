package armory.logicnode;

import iron.system.Tween;

class MixNode extends LogicNode {

	public var property0: String; // Type
	public var property1: String; // Ease
	public var property2: Bool; // Clamp

	var ease: Float->Float = null;

	public function new(tree: LogicTree) {
		super(tree);
	}

	function init() {
		switch (property0) {
			case "Linear":
				ease = Tween.easeLinear;
			case "Sine":
				ease = property1 == "In" ? Tween.easeSineIn : (property1 == "Out" ? Tween.easeSineOut : Tween.easeSineInOut);
			case "Quad":
				ease = property1 == "In" ? Tween.easeQuadIn : (property1 == "Out" ? Tween.easeQuadOut : Tween.easeQuadInOut);
			case "Cubic":
				ease = property1 == "In" ? Tween.easeCubicIn : (property1 == "Out" ? Tween.easeCubicOut : Tween.easeCubicInOut);
			case "Quart":
				ease = property1 == "In" ? Tween.easeQuartIn : (property1 == "Out" ? Tween.easeQuartOut : Tween.easeQuartInOut);
			case "Quint":
				ease = property1 == "In" ? Tween.easeQuintIn : (property1 == "Out" ? Tween.easeQuintOut : Tween.easeQuintInOut);
			case "Expo":
				ease = property1 == "In" ? Tween.easeExpoIn : (property1 == "Out" ? Tween.easeExpoOut : Tween.easeExpoInOut);
			case "Circ":
				ease = property1 == "In" ? Tween.easeCircIn : (property1 == "Out" ? Tween.easeCircOut : Tween.easeCircInOut);
			case "Back":
				ease = property1 == "In" ? Tween.easeBackIn : (property1 == "Out" ? Tween.easeBackOut : Tween.easeBackInOut);
			case "Bounce":
				ease = property1 == "In" ? Tween.easeBounceIn : (property1 == "Out" ? Tween.easeBounceOut : Tween.easeBounceInOut);
			case "Elastic":
				ease = property1 == "In" ? Tween.easeElasticIn : (property1 == "Out" ? Tween.easeElasticOut : Tween.easeElasticInOut);
			default:
				ease = Tween.easeLinear;
		}
	}

	override function get(from: Int): Dynamic {
		if (ease == null) init();
		var k: Float = inputs[0].get(); // Factor
		var v1: Float = inputs[1].get();
		var v2: Float = inputs[2].get();
		var f = v1 + (v2 - v1) * ease(k);

		// Clamp
		if (property2) f = f < 0 ? 0 : f > 1 ? 1 : f;

		return f;
	}
}
