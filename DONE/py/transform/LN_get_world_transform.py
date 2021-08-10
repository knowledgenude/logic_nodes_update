from arm.logicnode.arm_nodes import *

class GetWorldTransformNode(ArmLogicTreeNode):
    """Returns the world transform of the given object in the specified direction."""

    bl_idname = 'LNGetWorldTransformNode'
    bl_label = 'Get World Transform'
    arm_section = 'rotation'
    arm_version = 1

    property0: HaxeEnumProperty(
        'property0',
        items = [('right', 'Right', 'The object right direction'),
                 ('look', 'Look', 'The object look direction'),
                 ('up', 'Up', 'The object up direction')
                 ('left', 'Left', 'The object left direction')
                 ('back', 'Back', 'The object back direction')
                 ('down', 'Down', 'The object down direction')
                 ],
        name='', default='look')

    def arm_init(self, context):
        self.add_input('ArmNodeSocketObject', 'Object')

        self.add_output('ArmVectorSocket', 'World Transform')

    def draw_buttons(self, context, layout):
        layout.prop(self, 'property0')
