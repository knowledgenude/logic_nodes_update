from arm.logicnode.arm_nodes import *

class ArrayLengthNode(ArmLogicTreeNode):
    """Returns the length of the given array.
    
    @see [Haxe API](https://api.haxe.org/Array.html#pop)
    """

    bl_idname = 'LNArrayLengthNode'
    bl_label = 'Array Length'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketArray', 'Array')

        self.add_output('ArmIntSocket', 'Length')
