from arm.logicnode.arm_nodes import *

class PickObjectNode(ArmLogicTreeNode):
    """Picks the object in the given location using the 2D screen
    coordinates.

    @seeNode Mask

    @input Screen Coords: the location at which to pick, in screen
        coordinates
    @input Mask: a bit mask value to specify which
        objects are considered

    @output Object: the object that was hit
    @output Hit: the hit position in world coordinates
    """

    bl_idname = 'LNPickObjectNode'
    bl_label = 'Pick Object'
    arm_section = 'ray'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmVectorSocket', 'Screen Coords')
        self.add_input('ArmIntSocket', 'Mask', default_value=1)

        self.add_output('ArmNodeSocketObject', 'Object')
        self.add_output('ArmVectorSocket', 'Hit')
