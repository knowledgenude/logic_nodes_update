from arm.logicnode.arm_nodes import *

class GetActiveSceneNode(ArmLogicTreeNode):
    """Returns the current scene.

    @seeNode Set Active Scene
    @seeNode Remove Active Scene
    """

    bl_idname = 'LNGetActiveSceneNode'
    bl_label = 'Get Active Scene'
    arm_version = 1

    def arm_init(self, context):
        self.add_output('ArmDynamicSocket', 'Scene')