from arm.logicnode.arm_nodes import *

class InvertBooleanNode(ArmLogicTreeNode):
    """Inverts the plugged-in boolean. If its input is `true` it outputs `false`."""

    bl_idname = 'LNInvertBooleanNode'
    bl_label = 'Invert Boolean'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmBoolSocket', 'Bool')

        self.add_output('ArmBoolSocket', 'Inverted Bool')