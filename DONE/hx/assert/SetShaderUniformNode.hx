package armory.logicnode;

import kha.FastFloat;
import iron.math.Vec4;
import iron.object.Object;
import iron.object.Uniforms;
import iron.data.MaterialData;

class SetShaderUniformNode extends LogicNode {

	static var registered = false;
	static var intMap = new Map<String, Null<Int>>();
	static var floatMap = new Map<String, Null<FastFloat>>();
	static var vec2Map = new Map<String, Vec4>();
	static var vec3Map = new Map<String, Vec4>();
	static var vec4Map = new Map<String, Vec4>();

	/** Uniform type **/
	public var property0: String;

	public function new(tree: LogicTree) {
		super(tree);
		if (!registered) {
			registered = true;
			Uniforms.externalIntLinks.push(intLink);
			Uniforms.externalFloatLinks.push(floatLink);
			Uniforms.externalVec2Links.push(vec2Link);
			Uniforms.externalVec3Links.push(vec3Link);
			Uniforms.externalVec4Links.push(vec4Link);
		}
	}

	override function run(from: Int) {
		var uniformName: String = inputs[1].get();

		if (uniformName == null) return;

		switch (property0) {
			case "int": intMap.set(uniformName, inputs[2].get());
			case "float": floatMap.set(uniformName, inputs[2].get());
			case "vec2": vec2Map.set(uniformName, inputs[2].get());
			case "vec3": vec3Map.set(uniformName, inputs[2].get());
			case "vec4": vec4Map.set(uniformName, inputs[2].get());
			default:
		}

		runOutput(0);
	}

	static function intLink(object: Object, mat: MaterialData, link: String): Null<Int> {
		return intMap.get(link);
	}

	static function floatLink(object: Object, mat: MaterialData, link: String): Null<kha.FastFloat> {
		return floatMap.get(link);
	}

	static function vec2Link(object: Object, mat: MaterialData, link: String): iron.math.Vec4 {
		return vec2Map.get(link);
	}

	static function vec3Link(object: Object, mat: MaterialData, link: String): iron.math.Vec4 {
		return vec3Map.get(link);
	}

	static function vec4Link(object: Object, mat: MaterialData, link: String): iron.math.Vec4 {
		return vec4Map.get(link);
	}
}
