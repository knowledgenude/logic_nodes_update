from arm.logicnode.arm_nodes import *

class RemoveArrayValueNode(ArmLogicTreeNode):
    """Removes the element from the given array by its value.

    @seeNode Remove Array Index
    """

    bl_idname = 'LNRemoveArrayValueNode'
    bl_label = 'Remove Array Value'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketAction', 'In')
        self.add_input('ArmNodeSocketArray', 'Array')
        self.add_input('ArmDynamicSocket', 'Value')

        self.add_output('ArmNodeSocketAction', 'Out')
        self.add_output('ArmDynamicSocket', 'Value')
