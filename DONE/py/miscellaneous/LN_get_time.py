from arm.logicnode.arm_nodes import *

class GetTimeNode(ArmLogicTreeNode):
    """Returns the application times."""

    bl_idname = 'LNGetTimeNode'
    bl_label = 'Get Time'
    arm_version = 1

    def arm_init(self, context):
        self.add_output('ArmFloatSocket', 'Time')
        self.add_output('ArmFloatSocket', 'Delta')
        self.add_output('ArmFloatSocket', 'Real Delta')
