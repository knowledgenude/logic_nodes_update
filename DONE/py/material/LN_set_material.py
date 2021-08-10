from arm.logicnode.arm_nodes import *

class SetMaterialNode(ArmLogicTreeNode):
    """Set Material Slot node."""

    bl_idname = 'LNSetMaterialNode'
    bl_label = 'Set Material'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketAction', 'In')
        self.add_input('ArmNodeSocketObject', 'Object')
        self.add_input('ArmDynamicSocket', 'Material')
        self.add_input('ArmIntSocket', 'Slot')

        self.add_output('ArmNodeSocketAction', 'Out')
