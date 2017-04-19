#include "PantsRegisterInfo.h"

using namespace llvm;

#define GET_REGINFO_TARGET_DESC
#include "PantsGenRegisterInfo.inc"

const MCPhysReg *PantsRegisterInfo::getCalleeSavedRegs(const MachineFunction *MF) const {
    return CSR_SaveList;
}

BitVector PantsRegisterInfo::getReservedRegs(const MachineFunction &MF) const override {
  BitVector Reserved(getNumRegs());
  Reserved.set(PA::Rs);
  Reserved.set(PA::Sp);
  Reserved.set(PA::Fp);
  Reserved.set(PA::Pc);
  Reserved.set(PA::Sn);
  Reserved.set(PA::Me);
  Reserved.set(PA::Ra);
  return Reserved;
}

unsigned PantsRegisterInfo::getFrameRegister(const MachineFunction &MF) const override {
    return PA::Fp;
}

void PantsRegisterInfo::eliminateFrameIndex(MachineBasicBlock::iterator II,
                         int SPAdj, unsigned FIOperandNum,
                         RegScavenger *RS = nullptr) {

}
