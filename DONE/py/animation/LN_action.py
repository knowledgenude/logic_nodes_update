from arm.logicnode.arm_nodes import *

class ActionNode(ArmLogicTreeNode):
    """Stores the given action as a variable.
    """

    bl_idname = 'LNActionNode'
    bl_label = 'Action'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketAction', 'Action')

        self.add_output('ArmNodeSocketAction', 'Action', is_var=True)
