from arm.logicnode.arm_nodes import *

class GetActiveSceneNode(ArmLogicTreeNode):
    """Get the current scene."""
    bl_idname = 'LNGetActiveSceneNode'
    bl_label = 'Get Active Scene'
    arm_version = 1

    def arm_init(self, context):
        self.add_output('ArmDynamicSocket', 'Scene')
