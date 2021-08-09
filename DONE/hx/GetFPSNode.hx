package armory.logicnode;

import iron.system.Time;

class GetFPSNode extends LogicNode {

    public function new(tree: LogicTree) {
        super(tree);
    }

    override function get(from: Int): Dynamic {
        var fps = Math.round(1.0 / Time.realDelta);

        if ((fps == Math.POSITIVE_INFINITY) || (fps == Math.NEGATIVE_INFINITY) || (Math.isNaN(fps))) {
            fps = 0;
        }

        return fps;
    }
}
