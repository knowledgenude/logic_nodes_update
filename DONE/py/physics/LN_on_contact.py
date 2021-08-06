from arm.logicnode.arm_nodes import *

class OnContactNode(ArmLogicTreeNode):
    """Activates the output when the Object A have contact with
    Object B.

    @option Begin: the output is activated on the first frame when the
        two objects have contact
    @option End: the output is activated on the frame after the last
        frame when the two objects had contact
    @option Overlap: the output is activated on each frame the object
        have contact
    """

    bl_idname = 'LNOnContactNode'
    bl_label = 'On Contact'
    arm_section = 'contact'
    arm_version = 1

    property0: HaxeEnumProperty(
        'property0',
        items = [('begin', 'Begin', 'The contact between the rigid bodies begins'),
                 ('overlap', 'Overlap', 'The contact between the rigid bodies is happening'),
                 ('end', 'End', 'The contact between the rigid bodies ends')],
        name='', default='begin')

    def arm_init(self, context):
        self.add_input('ArmNodeSocketObject', 'Object A')
        self.add_input('ArmNodeSocketObject', 'Object B')

        self.add_output('ArmNodeSocketAction', 'Out')

    def draw_buttons(self, context, layout):
        layout.prop(self, 'property0')
