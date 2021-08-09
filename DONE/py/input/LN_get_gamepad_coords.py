from arm.logicnode.arm_nodes import *

class GetGamepadCoordsNode(ArmLogicTreeNode):
    """Returns the coordinates of the given gamepad.

    @seeNode Gamepad

    @input Gamepad: the ID of the gamepad.
    """

    bl_idname = 'LNGetGamepadCoordsNode'
    bl_label = 'Get Gamepad Coords'
    arm_version = 1
    arm_section = 'gamepad'

    def arm_init(self, context):
        self.add_output('ArmVectorSocket', 'Left Stick')
        self.add_output('ArmVectorSocket', 'Right Stick')
        self.add_output('ArmVectorSocket', 'Left Movement')
        self.add_output('ArmVectorSocket', 'Right Movement')
        self.add_output('ArmFloatSocket', 'Left Trigger')
        self.add_output('ArmFloatSocket', 'Right Trigger')

        self.add_input('ArmIntSocket', 'Gamepad')
