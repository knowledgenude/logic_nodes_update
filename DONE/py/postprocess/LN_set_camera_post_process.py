from arm.logicnode.arm_nodes import *

class CameraSetNode(ArmLogicTreeNode):
    """Set the post-processing effects of a camera."""

    bl_idname = 'LNCameraSetNode'
    bl_label = 'Set Camera Post Process'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmNodeSocketAction', 'In')
        self.add_input('ArmFloatSocket', 'F-stop', default_value=2.0)
        self.add_input('ArmFloatSocket', 'Shutter Time', default_value=1.0)
        self.add_input('ArmFloatSocket', 'ISO', default_value=100.0)
        self.add_input('ArmFloatSocket', 'Exposure Compensation', default_value=0.0)
        self.add_input('ArmFloatSocket', 'Fisheye Distortion', default_value=0.01)
        self.add_input('ArmBoolSocket', 'Auto Focus', default_value=True)
        self.add_input('ArmFloatSocket', 'DoF Distance', default_value=10.0)
        self.add_input('ArmFloatSocket', 'DoF Length', default_value=160.0)
        self.add_input('ArmFloatSocket', 'DoF F-Stop', default_value=128.0)
        self.add_input('ArmIntSocket', 'Tonemapper', default_value=0.0)
        self.add_input('ArmFloatSocket', 'Film Grain', default_value=2.0)

        self.add_output('ArmNodeSocketAction', 'Out')
