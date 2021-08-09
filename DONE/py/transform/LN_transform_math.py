from arm.logicnode.arm_nodes import *

class TransformMathNode(ArmLogicTreeNode):
    """Operates the two given transform values."""

    bl_idname = 'LNTransformMathNode'
    bl_label = 'Transform Math'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmDynamicSocket', 'Transform A')
        self.add_input('ArmDynamicSocket', 'Transform B')

        self.add_output('ArmDynamicSocket', 'Result')
