from arm.logicnode.arm_nodes import *

class MatrixMathNode(ArmLogicTreeNode):
    """Multiplies matrices."""

    bl_idname = 'LNMatrixMathNode'
    bl_label = 'Matrix Math'
    arm_section = 'matrix'
    arm_version = 1

    property0: HaxeEnumProperty(
        'property0',
        items = [('multiply', 'Multiply', 'Multiply')],
        name='', default='multiply')

    def arm_init(self, context):
        self.add_input('ArmDynamicSocket', 'Matrix A')
        self.add_input('ArmDynamicSocket', 'Matrix B')

        self.add_output('ArmDynamicSocket', 'Result')

    def draw_buttons(self, context, layout):
        layout.prop(self, 'property0')
