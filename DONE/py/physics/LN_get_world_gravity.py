from arm.logicnode.arm_nodes import *

class GetWorldGravityNode(ArmLogicTreeNode):
    """Returns the world gravity.

    @seeNode Set World Gravity
    """

    bl_idname = 'LNGetWorldGravityNode'
    bl_label = 'Get World Gravity'
    arm_version = 1

    def arm_init(self, context):
        self.add_output('ArmVectorSocket', 'World Gravity')
