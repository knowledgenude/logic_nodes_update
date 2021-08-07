from arm.logicnode.arm_nodes import *

class AddTraitToObjectNode(ArmLogicTreeNode):
    """Add trait to the given object."""

    bl_idname = 'LNAddTraitToObjectNode'
    bl_label = 'Add Trait to Object'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketAction', 'In')
        self.add_input('ArmNodeSocketObject', 'Object')
        self.add_input('ArmDynamicSocket', 'Trait')

        self.add_output('ArmNodeSocketAction', 'Out')
