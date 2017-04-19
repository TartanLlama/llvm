#include "PantsInstrInfo.h"

unsigned isLoadFromStackSlot(const MachineInstr &MI,
                             int &FrameIndex) {
    return 0;
}

unsigned isStoreToStackSlot(const MachineInstr &MI,
                            int &FrameIndex) {
    return 0;
}

void copyPhysReg(MachineBasicBlock &MBB, MachineBasicBlock::iterator I,
                 const DebugLoc &DL, unsigned DestReg, unsigned SrcReg,
                 bool KillSrc) {
      
}

void storeRegToStackSlot(MachineBasicBlock &MBB,
                         MachineBasicBlock::iterator MBBI,
                         unsigned SrcReg, bool isKill, int FrameIndex,
                         const TargetRegisterClass *RC,
                         const TargetRegisterInfo *TRI) {

}

void loadRegFromStackSlot(MachineBasicBlock &MBB,
                          MachineBasicBlock::iterator MBBI,
                          unsigned DestReg, int FrameIndex,
                          const TargetRegisterClass *RC,
                          const TargetRegisterInfo *TRI) {

}

