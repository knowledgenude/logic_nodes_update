from arm.logicnode.arm_nodes import *

class ColorNode(ArmLogicTreeNode):
    """Stores the given color as a variable."""

    bl_idname = 'LNColorNode'
    bl_label = 'Color'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmFloatSocket', 'R', default_value=1.0)
        self.add_input('ArmFloatSocket', 'G', default_value=1.0)
        self.add_input('ArmFloatSocket', 'B', default_value=1.0)

        self.add_output('ArmColorSocket', 'Color', is_var=True)
