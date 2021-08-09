from arm.logicnode.arm_nodes import *

class GetObjectChildNode(ArmLogicTreeNode):
    """Returns the child of the given object by the child object's name."""

    bl_idname = 'LNGetObjectChildNode'
    bl_label = 'Get Object Child'
    arm_section = 'relations'
    arm_version = 1

    property0: HaxeEnumProperty(
        'property0',
        items = [('by name', 'By Name', 'By Name'),
                 ('contains', 'Contains', 'Contains'),
                 ('starts with', 'Starts With', 'Starts With'),
                 ('ends with', 'Ends With', 'Ends With'),
                 ],
        name='', default='By Name')

    def arm_init(self, context):
        self.add_input('ArmNodeSocketObject', 'Object')
        self.add_input('ArmStringSocket', 'Child Name')

        self.add_output('ArmNodeSocketObject', 'Child')

    def draw_buttons(self, context, layout):
        layout.prop(self, 'property0')
