package armory.logicnode;

import kha.System;

class SetVibrateNode extends LogicNode {

    public function new(tree: LogicTree) {
        super(tree);
    }

    override function run(from: Int) {
        var ms = inputs[1].get();

        if (ms == null) return;

        System.vibrate(inputs[1].get());

        runOutput(0);
    }
}
