from arm.logicnode.arm_nodes import *

class GetArrayLengthNode(ArmLogicTreeNode):
    """Returns the length of the given array."""

    bl_idname = 'LNGetArrayLengthNode'
    bl_label = 'Get Array Length'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketArray', 'Array')

        self.add_output('ArmIntSocket', 'Length')
