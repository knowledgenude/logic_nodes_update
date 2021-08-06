from arm.logicnode.arm_nodes import *

class GetVelocityNode(ArmLogicTreeNode):
    """Returns the world velocity of the given object.

    @seeNode Set Velocity
    """

    bl_idname = 'LNGetVelocityNode'
    bl_label = 'Get Velocity'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketObject', 'Object')
        self.add_input('ArmBoolSocket', 'Linear On Local Axis')
        self.add_input('ArmBoolSocket', 'Angular On Local Axis')

        self.add_output('ArmVectorSocket', 'Linear')
        self.add_output('ArmVectorSocket', 'Angular')
