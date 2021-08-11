from arm.logicnode.arm_nodes import *

class GetObjectMeshNode(ArmLogicTreeNode):
    """Returns the mesh of the given object."""

    bl_idname = 'LNGetObjectMeshNode'
    bl_label = 'Get Mesh'
    arm_section = 'props'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketObject', 'Object')

        self.add_output('ArmDynamicSocket', 'Mesh')
