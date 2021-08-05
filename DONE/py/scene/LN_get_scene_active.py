from arm.logicnode.arm_nodes import *

class GetSceneActiveNode(ArmLogicTreeNode):
    """Returns the current scene."""
    bl_idname = 'LNGetSceneActiveNode'
    bl_label = 'Get Scene Active'
    arm_version = 1

    def arm_init(self, context):
        self.add_output('ArmDynamicSocket', 'Scene')