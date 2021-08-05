from arm.logicnode.arm_nodes import *

class GetActiveCameraNode(ArmLogicTreeNode):
    """Returns the active camera in the active scene.

    @seeNode Set Active Camera
    @seeNode Set Camera FOV
    """

    bl_idname = 'LNGetActiveCameraNode'
    bl_label = 'Get Active Camera'
    arm_version = 1

    def arm_init(self, context):
        self.add_output('ArmNodeSocketObject', 'Camera')
