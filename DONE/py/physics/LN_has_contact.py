from arm.logicnode.arm_nodes import *

class HasContactNode(ArmLogicTreeNode):
    """Returns whether exists contact between Object A and Object B.
    """

    bl_idname = 'LNHasContactNode'
    bl_label = 'Has Contact'
    arm_section = 'contact'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketObject', 'Object A')
        self.add_input('ArmNodeSocketObject', 'Object B')

        self.add_output('ArmBoolSocket', 'Has Contact')
