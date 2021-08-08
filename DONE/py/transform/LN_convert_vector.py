from arm.logicnode.arm_nodes import *

class ConvertVectorNode(ArmLogicTreeNode):
    """Convert vector coordinates to the given object local space or to its world space.

    @seeNode Get World Orientation
    @seeNode Vector From Transform
    """

    bl_idname = 'LNConvertVectorNode'
    bl_label = 'Convert Vector'
    arm_section = 'rotation'
    arm_version = 1

    property0: HaxeEnumProperty(
        'property0',
        items = [('to local space', 'To Local Space', 'The vector is converted to object local space'),
                 ('to world space', 'To World Space', 'The vector is converted to world space'),
                 ],
        name='', default='object')

    def arm_init(self, context):
        self.add_input('ArmNodeSocketObject', 'Object')
        self.add_input('ArmVectorSocket', 'Vector')
        self.add_input('ArmBoolSocket', 'Location Influence', default_value=True)

        self.add_output('ArmVectorSocket', 'Local')

    def draw_buttons(self, context, layout):
        layout.prop(self, 'property0')