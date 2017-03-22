#include "llvm/Target/TargetMachine.h"

namespace llvm {
    class PantsTargetMachine : public LLVMTargetMachine {
        const DataLayout DataLayout;       // Calculates type size & alignment
        PantsInstrInfo InstrInfo;
        TargetFrameInfo FrameInfo;

    protected:
        virtual const TargetAsmInfo *createTargetAsmInfo() const;

    public:
        PantsTargetMachine(const Module &M, const std::string &FS);

        virtual const PantsInstrInfo *getInstrInfo() const {return &InstrInfo; }
        virtual const TargetFrameInfo *getFrameInfo() const {return &FrameInfo; }
        virtual const TargetSubtarget *getSubtargetImpl() const{return &Subtarget; }
        virtual const TargetRegisterInfo *getRegisterInfo() const {
            return &InstrInfo.getRegisterInfo();
        }
        virtual const DataLayout *getDataLayout() const { return &DataLayout; }
        static unsigned getModuleMatchQuality(const Module &M);

        // Pass Pipeline Configuration
        virtual bool addInstSelector(PassManagerBase &PM, bool Fast);
        virtual bool addPreEmitPass(PassManagerBase &PM, bool Fast);
    };
    };
}


Target llvm::getThePantsTarget() {
    static Target ThePantsTarget;
    return ThePantsTarget;
}

extern "C" void LLVMInitializeSparcTargetInfo() {
  RegisterTarget<Triple::pants, /*HasJIT=*/false>
    X(getThePantsTarget(), "pants", "Pants");
}

extern "C" void LLVMInitializePantsAsmPrinter() {
  RegisterAsmPrinter<PantsAsmPrinter> X(getThePantsTarget());
}
