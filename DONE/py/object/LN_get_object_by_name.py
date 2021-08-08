import bpy

from arm.logicnode.arm_nodes import *

class GetObjectByNameNode(ArmLogicTreeNode):
    """Returns the object in the active scene that have the given name if it exists."""

    bl_idname = 'LNGetObjectByNameNode'
    bl_label = 'Get Object by Name'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmStringSocket', 'Name')

        self.add_output('ArmNodeSocketObject', 'Object')
