from arm.logicnode.arm_nodes import *

class RemoveRigidBodyNode (ArmLogicTreeNode):
    """Removes the rigid body from the given object."""

    bl_idname = 'LNRemoveRigidBodyNode'
    bl_label = 'Remove Rigid Body'
    arm_version = 1

    def arm_init(self, context):
        self.inputs.new('ArmNodeSocketAction', 'In')
        self.inputs.new('ArmNodeSocketObject', 'Object')

        self.outputs.new('ArmNodeSocketAction', 'Out')
