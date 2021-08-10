from arm.logicnode.arm_nodes import *

class SelfTraitNode(ArmLogicTreeNode):
    """Return this trait."""

    bl_idname = 'LNSelfTraitNode'
    bl_label = 'Self Trait'
    arm_version = 1

    def arm_init(self, context):
        self.add_output('ArmDynamicSocket', 'Trait')
