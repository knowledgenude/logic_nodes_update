package armory.logicnode;

import hscript.Parser;
import hscript.Interp;
import hscript.Expr;

class ScriptNode extends LogicNode {

	public var property0: String;
	var result: Dynamic;

	#if hscript
	var parser: Parser = null;
	var interp: Interp = null;
	var ast: Expr = null;
	#end

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function run(from: Int) {
		var v: Dynamic = inputs[1].get();

		#if hscript
		if (parser == null) {
			parser = new Parser();
			parser.allowJSON = true;
			parser.allowTypes = true;
			ast = parser.parseString(property0);
			interp = new Interp();
			interp.variables.set("Math", Math);
			interp.variables.set("Std", Std);
		}

		interp.variables.set("input", v);
		result = interp.execute(ast);
		#end

		runOutput(0);
	}

	override function get(from: Int): Dynamic {
		return result;
	}
}
