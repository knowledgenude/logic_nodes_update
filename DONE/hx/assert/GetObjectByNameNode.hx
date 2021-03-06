package armory.logicnode;

/*
This file was previously GetObjectNode.hx and was renamed to be updated
Original author: luboslenco
Contributor(s): MoritzBrueckner, QuantumCoderQC
*/

class GetObjectByNameNode extends LogicNode {

	/** Scene from which to take the object **/
	public var property0: Null<String>;

	public function new(tree: LogicTree) {
		super(tree);
	}

	override function get(from: Int): Dynamic {
		var objectName: String = inputs[0].get();
		
		return iron.Scene.active.getChild(objectName);
	}
}
