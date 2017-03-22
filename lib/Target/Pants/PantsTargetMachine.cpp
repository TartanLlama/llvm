#include "PantsTargetMachine.h"

PantsTargetMachine::PantsTargetMachine(const Module &M, const std::string &FS)
    : DataLayout("e-p:32:32"), InstrInfo(),
    FrameInfo(TargetFrameInfo::StackGrowsDown, 8, 0)
{

}


Target llvm::getTheSparcTarget();

extern "C" void LLVMInitializeSparcTargetInfo() {
  RegisterTarget<Triple::sparc, /*HasJIT=*/false>
    X(getTheSparcTarget(), "sparc", "Sparc");
}
