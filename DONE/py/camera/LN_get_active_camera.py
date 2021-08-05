from arm.logicnode.arm_nodes import *

class GetActiveCameraNode(ArmLogicTreeNode):
    """Returns the current camera.

    @seeNode Set Active Camera
    """
    bl_idname = 'LNGetActiveCameraNode'
    bl_label = 'Get Active Camera'
    arm_version = 1

    def arm_init(self, context):
        self.add_output('ArmNodeSocketObject', 'Camera')
