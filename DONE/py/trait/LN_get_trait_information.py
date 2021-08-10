from arm.logicnode.arm_nodes import *

class GetTraitInformationNode(ArmLogicTreeNode):
    """Returns the avaiable information about the given trait."""

    bl_idname = 'LNGetTraitInformationNode'
    bl_label = 'Get Trait Information'
    arm_version = 1

    def arm_init(self, context):
        self.add_input('ArmDynamicSocket', 'Trait')

        self.add_output('ArmStringSocket', 'Name')
        self.add_output('ArmStringSocket', 'Class Type')
