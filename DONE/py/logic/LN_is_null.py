from arm.logicnode.arm_nodes import *


class IsNullNode(ArmLogicTreeNode):
    """If the given value is null activates the Is Null output.
    Otherwise activates the Is Not Null output.
    
    @seeNode Branch
    """

    bl_idname = 'LNIsNullNode'
    bl_label = 'Is Null'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketAction', 'In')
        self.add_input('ArmDynamicSocket', 'Value')

        self.add_output('ArmNodeSocketAction', 'Is Null')
        self.add_output('ArmNodeSocketAction', 'Is Not Null')