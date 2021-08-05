from arm.logicnode.arm_nodes import *

class SetActiveSceneNode(ArmLogicTreeNode):
    """Changes the current scene to another."""
    bl_idname = 'LNSetActiveSceneNode'
    bl_label = 'Set Active Scene'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketAction', 'In')
        self.add_input('ArmDynamicSocket', 'Scene')

        self.add_output('ArmNodeSocketAction', 'Out')
        self.add_output('ArmNodeSocketObject', 'Root')
