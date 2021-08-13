from arm.logicnode.arm_nodes import *

class RemoveArrayIndexNode(ArmLogicTreeNode):
    """Removes the element of the array at the given index.

    @seeNode Remove Array Value
    """

    bl_idname = 'LNRemoveArrayIndexNode'
    bl_label = 'Remove Array Index'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketAction', 'In')
        self.add_input('ArmNodeSocketArray', 'Array')
        self.add_input('ArmIntSocket', 'Index')

        self.add_output('ArmNodeSocketAction', 'Out')
        self.add_output('ArmDynamicSocket', 'Value')
