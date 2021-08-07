from arm.logicnode.arm_nodes import *

class GetActionStateNode(ArmLogicTreeNode):
    """Returns the information about the current action of the given object."""

    bl_idname = 'LNGetActionStateNode'
    bl_label = 'Get Action State'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketObject', 'Object')

        self.add_output('ArmStringSocket', 'Action')
        self.add_output('ArmIntSocket', 'Frame')
        self.add_output('ArmBoolSocket', 'Is Paused')
