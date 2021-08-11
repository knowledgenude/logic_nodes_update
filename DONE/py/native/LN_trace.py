from arm.logicnode.arm_nodes import *

class TraceNode(ArmLogicTreeNode):
    """Traces the given value to the console."""

    bl_idname = 'LNTraceNode'
    bl_label = 'Trace'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketAction', 'In')
        self.add_input('ArmStringSocket', 'String')

        self.add_output('ArmNodeSocketAction', 'Out')
