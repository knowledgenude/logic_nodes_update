from arm.logicnode.arm_nodes import *

class OnVolumeTriggerNode(ArmLogicTreeNode):
    """Activates the output when the Object A enters, overlaps or leaves the bounding box of the Object B. (Note: Works even if objects are not Rigid Bodies)."""

    bl_idname = 'LNOnVolumeTriggerNode'
    bl_label = 'On Volume Trigger'
    arm_version = 1

    property0: HaxeEnumProperty(
        'property0',
        items = [('begin', 'Begin', 'Object A just begins to overlap Object B'),
                 ('overlap', 'Overlap', 'Object A is overlaping Object B'),
                 ('end', 'End', 'Object A just stoped overlaping Object B')],
        name='', default='begin')

    def arm_init(self, context):
        self.add_input('ArmNodeSocketObject', 'Object A')
        self.add_input('ArmNodeSocketObject', 'Object B')

        self.add_output('ArmNodeSocketAction', 'Out')

    def draw_buttons(self, context, layout):
        layout.prop(self, 'property0')
