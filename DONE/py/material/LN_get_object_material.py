from arm.logicnode.arm_nodes import *

class GetObjectMaterialNode(ArmLogicTreeNode):
    """Returns the material in the specified slot of the given object."""

    bl_idname = 'LNGetObjectMaterialNode'
    bl_label = 'Get Object Material'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketObject', 'Object')
        self.add_input('ArmIntSocket', 'Slot')

        self.add_output('ArmDynamicSocket', 'Material')
