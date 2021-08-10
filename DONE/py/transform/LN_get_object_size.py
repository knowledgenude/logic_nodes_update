from arm.logicnode.arm_nodes import *

class GetObjectSizeNode(ArmLogicTreeNode):
    """Returns the scale of the given object."""

    bl_idname = 'LNGetObjectSizeNode'
    bl_label = 'Get Object Size'
    arm_section = 'scale'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketObject', 'Object')

        self.add_output('ArmVectorSocket', 'Dimension')
        self.add_output('ArmVectorSocket', 'Scale')
