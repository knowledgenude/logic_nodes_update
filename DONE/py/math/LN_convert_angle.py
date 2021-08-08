from arm.logicnode.arm_nodes import *

class ConvertAngleNode(ArmLogicTreeNode):
    """Converts the measuring unit of the given angle from radian to degree or vice-versa."""

    bl_idname = 'LNConvertAngleNode'
    bl_label = 'Convert Angle'
    arm_version = 1
    arm_section = 'angle'

    property0: HaxeEnumProperty(
        'property0',
        items = [('radian to degree', 'Radian to Degree', 'Convert angle from radian to degree'),
                 ('degree to radian', 'Degree to Radian', 'Convert angle from degree to radian'),
                 ],
        name='', default='radian to degree')

    def arm_init(self, context):
        self.add_input('ArmFloatSocket', 'Angle In')

        self.add_output('ArmFloatSocket', 'Angle Out')

    def draw_buttons(self, context, layout):
        layout.prop(self, 'property0')