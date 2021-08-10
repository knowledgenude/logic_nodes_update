package armory.logicnode;

import kha.System;

class GetSystemName extends LogicNode {

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var systemName: String = System.systemId;

		return switch (from) {
			default: null;
			case 0: systemName;
			case 1: equalsCI(systemName, 'Windows');
			case 2: equalsCI(systemName, 'Linux');
			case 3: equalsCI(systemName, 'Mac');
			case 4: equalsCI(systemName, 'HTML5');
			case 5: equalsCI(systemName, 'Android');
		}
	}

	static inline function equalsCI(a: String, b: String): Bool {
		return a.toLowerCase() == b.toLowerCase();
	}
}
