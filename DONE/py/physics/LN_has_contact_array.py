from arm.logicnode.arm_nodes import *

class HasContactArrayNode(ArmLogicTreeNode):
    """Returns whether exists contact between Object and the Objects in the list."""

    bl_idname = 'LNHasContactArrayNode'
    bl_label = 'Has Contact Array'
    arm_section = 'contact'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketObject', 'Object')
        self.add_input('ArmNodeSocketArray', 'Objects')

        self.add_output('ArmBoolSocket', 'Has Contact')
