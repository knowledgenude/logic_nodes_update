from arm.logicnode.arm_nodes import *

class StringLengthNode(ArmLogicTreeNode):
    """Returns the length of the given string."""

    bl_idname = 'LNStringLengthNode'
    bl_label = 'String Length'
    arm_version = 1

    def arm_init(self, context):
        self.add_output('ArmIntSocket', 'Length')

        self.add_input('ArmStringSocket', 'String')
