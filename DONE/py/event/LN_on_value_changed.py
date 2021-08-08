from arm.logicnode.arm_nodes import *

class OnValueChangedNode(ArmLogicTreeNode):
    """Runs the output if the connected value is changed. While the connected value is null it will not work.

    @output Initial Value Changed: Activates only once when the initial value is defined
    @output Value Changed: Activates all the time the connected value is changed
    @output Value Unchanged: Activates if the connected value becomes the same as the initial value
    """

    bl_idname = 'LNOnValueChangedNode'
    bl_label = 'On Value Changed'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmDynamicSocket', 'Value')

        self.add_output('ArmNodeSocketAction', 'Initial Value Changed')
        self.add_output('ArmNodeSocketAction', 'Value Changed')
        self.add_output('ArmNodeSocketAction', 'Value Unchanged')
        self.add_output('NodeSocketShader', 'Initial Value')
        self.add_output('NodeSocketShader', 'Value')
