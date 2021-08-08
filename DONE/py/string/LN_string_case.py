from arm.logicnode.arm_nodes import *

class StringCaseNode(ArmLogicTreeNode):
    """Changes the given string case."""

    bl_idname = 'LNStringCaseNode'
    bl_label = 'String Case'
    arm_version = 1
    property0: HaxeEnumProperty(
        'property0',
        items = [('upper case', 'Upper Case', 'Change string case to upper case'),
                 ('lower case', 'Lower Case', 'Change string case to lower case'),
                 ],
        name='', default='Upper Case')

    def arm_init(self, context):
        self.add_input('ArmStringSocket', 'String In')

        self.add_output('ArmStringSocket', 'String Out')

    def draw_buttons(self, context, layout):
        layout.prop(self, 'property0')
