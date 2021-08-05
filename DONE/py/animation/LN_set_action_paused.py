from arm.logicnode.arm_nodes import *

class SetActionPausedNode(ArmLogicTreeNode):
    """Sets whether the action of the given object is paused or not.
    """

    bl_idname = 'LNSetActionPausedNode'
    bl_label = 'Set Action Paused'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketAction', 'In')
        self.add_input('ArmNodeSocketObject', 'Object')
        self.add_input('ArmBoolSocket', 'Paused')

        self.add_output('ArmNodeSocketAction', 'Out')
