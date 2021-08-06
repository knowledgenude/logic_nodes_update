from arm.logicnode.arm_nodes import *

class SetObjectGravityEnabledNode(ArmLogicTreeNode):
    """Sets whether the given object gravity is enabled.
    """

    bl_idname = 'LNSetObjectGravityEnabledNode'
    bl_label = 'Set Object Gravity Enabled'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketAction', 'In')
        self.add_input('ArmNodeSocketObject', 'Object')
        self.add_input('ArmBoolSocket', 'Enabled')

        self.add_output('ArmNodeSocketAction', 'Out')
