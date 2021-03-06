from arm.logicnode.arm_nodes import *

class ArrayContainsNode(ArmLogicTreeNode):
    """Returns whether the given array contains the given value.
    
    @see [Haxe API](https://api.haxe.org/Array.html#contains)
    """

    bl_idname = 'LNArrayContainsNode'
    bl_label = 'Array Contains'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketArray', 'Array')
        self.add_input('ArmDynamicSocket', 'Value')

        self.add_output('ArmBoolSocket', 'Contains')
