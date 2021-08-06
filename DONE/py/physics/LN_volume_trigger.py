from arm.logicnode.arm_nodes import *

class VolumeTriggerNode(ArmLogicTreeNode):
    """Returns `true` if the given Object A enters, overlaps or leaves the
    bounding box of Object B.
    """

    bl_idname = 'LNVolumeTriggerNode'
    bl_label = 'Volume Trigger'
    arm_section = 'misc'
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

        self.add_output('ArmBoolSocket', 'Bool')

    def draw_buttons(self, context, layout):
        layout.prop(self, 'property0')
