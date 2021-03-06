from arm.logicnode.arm_nodes import *

class SetObjectActivationStateNode(ArmLogicTreeNode):
    """Sets the rigid body simulation state of the given object."""

    bl_idname = 'LNSetObjectActivationStateNode'
    bl_label = 'Set Object Activation State'
    bl_icon = 'NONE'
    arm_version = 1

    property0: HaxeEnumProperty(
        'property0',
        items = [('inactive', 'Inactive', 'The rigid body simulation is deactivated'),
                 ('active', 'Active', 'The rigid body simulation is activated'),
                 ('always active', 'Always Active', 'The rigid body simulation is never deactivated'),
                 ('always inactive', 'Always Inactive', 'The rigid body simulation is never activated'),
                 ],
        name='', default='inactive')

    def arm_init(self, context):
        self.inputs.new('ArmNodeSocketAction', 'In')
        self.inputs.new('ArmNodeSocketObject', 'Object')

        self.outputs.new('ArmNodeSocketAction', 'Out')

    def draw_buttons(self, context, layout):
        layout.prop(self, 'property0')
