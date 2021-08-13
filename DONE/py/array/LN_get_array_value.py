from arm.logicnode.arm_nodes import *

class GetArrayValueNode(ArmLogicTreeNode):
    """Returns the value of the given array index."""

    bl_idname = 'LNGetArrayValueNode'
    bl_label = 'Get Array Value'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketArray', 'Array')
        self.add_input('ArmIntSocket', 'Index')

        self.add_output('ArmDynamicSocket', 'Value')
