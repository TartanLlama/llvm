#ifndef LLVM_LIB_TARGET_PANTS_PANTSREGISTERINFO_H
#define LLVM_LIB_TARGET_PANTS_PANTSREGISTERINFO_H

#include "llvm/Target/TargetRegisterInfo.h"

#define GET_REGINFO_HEADER
#include "PantsGenRegisterInfo.inc"

namespace llvm {
struct PantsRegisterInfo : public PantsGenRegisterInfo {
  PantsRegisterInfo();

  const MCPhysReg *getCalleeSavedRegs(const MachineFunction *MF) const override;
  BitVector getReservedRegs(const MachineFunction &MF) const override;
  unsigned getFrameRegister(const MachineFunction &MF) const override;

  void eliminateFrameIndex(MachineBasicBlock::iterator II,
                           int SPAdj, unsigned FIOperandNum,
                           RegScavenger *RS = nullptr) const override;

};

} // end namespace llvm

#endif
