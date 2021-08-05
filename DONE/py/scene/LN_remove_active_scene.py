from arm.logicnode.arm_nodes import *

class RemoveActiveSceneNode(ArmLogicTreeNode):
    """Removes the active scene.

    @seeNode Get Active Scene
    @seeNode Set Active Scene
    """

    bl_idname = 'LNRemoveActiveSceneNode'
    bl_label = 'Remove Active Scene'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketAction', 'In')

        self.add_output('ArmNodeSocketAction', 'Out')
