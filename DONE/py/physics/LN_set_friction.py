from arm.logicnode.arm_nodes import *

class SetFrictionNode (ArmLogicTreeNode):
    """Sets the friction of the given object.
    """

    bl_idname = 'LNSetFrictionNode'
    bl_label = 'Set Friction'
    bl_icon = 'NONE'
    arm_version = 1

    def arm_init(self, context):
        self.inputs.new('ArmNodeSocketAction', 'In')
        self.inputs.new('ArmNodeSocketObject', 'Object')
        self.inputs.new('ArmFloatSocket', 'Friction')

        self.outputs.new('ArmNodeSocketAction', 'Out')