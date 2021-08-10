from arm.logicnode.arm_nodes import *

class GetGlobalObjectNode(ArmLogicTreeNode):
    """Gives access to a global object which can be used to share
    information between different traits."""

    bl_idname = 'LNGetGlobalObjectNode'
    bl_label = 'Get Global Object'
    arm_version = 1

    def arm_init(self, context):
        self.add_output('ArmNodeSocketObject', 'Object')
