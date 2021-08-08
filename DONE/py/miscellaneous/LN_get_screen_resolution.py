from arm.logicnode.arm_nodes import *

class GetScreenResolutionNode(ArmLogicTreeNode):
    """Returns the current display resolution."""

    bl_idname = 'LNGetScreenResolutionNode'
    bl_label = 'Get Screen Resolution'
    arm_section = 'screen'
    arm_version = 1

    def arm_init(self, context):
        self.add_output('ArmIntSocket', 'Display Width')
        self.add_output('ArmIntSocket', 'Display Height')
        self.add_output('ArmIntSocket', 'Window Width')
        self.add_output('ArmIntSocket', 'Window Height')
