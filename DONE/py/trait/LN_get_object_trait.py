from arm.logicnode.arm_nodes import *

class GetObjectTraitNode(ArmLogicTreeNode):
    """Returns the trait that the given object own with the specified name."""

    bl_idname = 'LNGetObjectTraitNode'
    bl_label = 'Get Object Trait'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketObject', 'Object')
        self.add_input('ArmStringSocket', 'Name')

        self.add_output('ArmDynamicSocket', 'Trait')
