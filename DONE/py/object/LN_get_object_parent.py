from arm.logicnode.arm_nodes import *

class GetObjectParentNode(ArmLogicTreeNode):
    """Returns the direct parent (nearest in the hierarchy) of the given object.

    @seeNode Set Object Parent
    """

    bl_idname = 'LNGetObjectParentNode'
    bl_label = 'Get Object Parent'
    arm_section = 'relations'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketObject', 'Child')

        self.add_output('ArmNodeSocketObject', 'Parent')
