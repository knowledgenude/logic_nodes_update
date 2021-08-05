from arm.logicnode.arm_nodes import *

class SetParticleSpeedNode(ArmLogicTreeNode):
    """Sets the particles speed of the given object.
    """

    bl_idname = 'LNSetParticleSpeedNode'
    bl_label = 'Set Particle Speed'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketAction', 'In')
        self.add_input('ArmNodeSocketObject', 'Object')
        self.add_input('ArmFloatSocket', 'Speed', default_value=1.0)

        self.add_output('ArmNodeSocketAction', 'Out')
