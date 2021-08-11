from arm.logicnode.arm_nodes import *

class OnUpdateNode(ArmLogicTreeNode):
    """Activates the output on every frame.

    @option Update: (default) activates the output every frame.
    @option Late Update: activates the output after all non-late updates are calculated.
    @option Physics Pre-Update: activates the output before calculating the physics.
        Only available when using a physics engine.
    """

    bl_idname = 'LNOnUpdateNode'
    bl_label = 'On Update'
    arm_version = 1
    property0: HaxeEnumProperty(
        'property0',
        items = [('update', 'Update', 'Update'),
                 ('late update', 'Late Update', 'Late Update'),
                 ('physics pre-update', 'Physics Pre-Update', 'Physics Pre-Update')],
        name='On', default='update')

    def arm_init(self, context):
        self.add_output('ArmNodeSocketAction', 'Out')

    def draw_buttons(self, context, layout):
        layout.prop(self, 'property0')
