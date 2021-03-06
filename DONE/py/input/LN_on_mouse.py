from arm.logicnode.arm_nodes import *

class OnMouseNode(ArmLogicTreeNode):
    """Activates the output on the given mouse event."""

    bl_idname = 'LNOnMouseNode'
    bl_label = 'On Mouse'
    arm_section = 'mouse'
    arm_version = 1

    property0: HaxeEnumProperty(
        'property0',
        items = [('started', 'Started', 'The mouse button is just pressed'),
                 ('down', 'Down', 'The mouse button is pressed'),
                 ('released', 'Released', 'The mouse button is just released'),
                 ('moved', 'Moved', 'Moved')],
        name='', default='down')
    property1: HaxeEnumProperty(
        'property1',
        items = [('left', 'Left', 'Left mouse button'),
                 ('middle', 'Middle', 'Middle mouse button'),
                 ('right', 'Right', 'Right mouse button')],
        name='', default='left')

    def arm_init(self, context):
        self.add_output('ArmNodeSocketAction', 'Out')
        self.add_output('ArmBoolSocket', 'State')

    def draw_buttons(self, context, layout):
        layout.prop(self, 'property0')
        layout.prop(self, 'property1')

    def draw_label(self) -> str:
        return f'{self.bl_label}: {self.property1}'
