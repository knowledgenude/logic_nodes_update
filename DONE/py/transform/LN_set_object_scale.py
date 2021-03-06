from arm.logicnode.arm_nodes import *

class SetObjectScaleNode(ArmLogicTreeNode):
    """Scales the given object."""

    bl_idname = 'LNSetObjectScaleNode'
    bl_label = 'Set Object Scale'
    arm_section = 'scale'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketAction', 'In')
        self.add_input('ArmNodeSocketObject', 'Object')
        self.add_input('ArmVectorSocket', 'Scale', default_value=[1.0, 1.0, 1.0])

        self.add_output('ArmNodeSocketAction', 'Out')
