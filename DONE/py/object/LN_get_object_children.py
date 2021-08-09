from arm.logicnode.arm_nodes import *

class GetObjectChildrenNode(ArmLogicTreeNode):
    """Returns the children objects of the given object."""

    bl_idname = 'LNGetObjectChildrenNode'
    bl_label = 'Get Object Children'
    arm_section = 'relations'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketObject', 'Object')

        self.add_output('ArmNodeSocketArray', 'Children')
