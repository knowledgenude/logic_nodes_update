from arm.logicnode.arm_nodes import *

class DefaultIfEmptyNode(ArmLogicTreeNode):
    """Returns the connected value only if it is not equal to the given condition. Otherwise returns the Default value.

    @input Value: The value that will be eventually empty
    @input Default: The value that will be returned in case the main value is empty
    """

    bl_idname = 'LNDefaultIfEmptyNode'
    bl_label = 'Default if Empty'
    arm_version = 1

    property0: HaxeEnumProperty(
        'property0',
        items = [('null', 'Null', 'Return the Default value if the connected value is null'),
                 ('empty string', 'Return the Default value if the connected value is an empty string'),
                 ('zero', 'Zero', 'Return the Default value if the connected value is zero'),
                 ],
        name='', default='null')

    def arm_init(self, context):
        self.inputs.new('ArmDynamicSocket', 'Value In')
        self.inputs.new('ArmDynamicSocket', 'Default')

        self.outputs.new('ArmDynamicSocket', 'Value Out')

    def draw_buttons(self, context, layout):
        layout.prop(self, 'property0')