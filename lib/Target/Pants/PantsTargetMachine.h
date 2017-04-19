#include "llvm/Target/TargetMachine.h"
#include "llvm/Support/TargetRegistry.h"
#include "PantsInstrInfo.h"

namespace llvm {
    class PantsTargetMachine : public LLVMTargetMachine {
        const DataLayout DLayout;       // Calculates type size & alignment
        PantsInstrInfo InstrInfo;

    public:
        PantsTargetMachine(const Module &M, const std::string &FS);

        virtual const PantsInstrInfo *getInstrInfo() const {return &InstrInfo; }
        virtual const TargetRegisterInfo *getRegisterInfo() const {
            return &InstrInfo.getRegisterInfo();
        }
        virtual const DataLayout *getDataLayout() const { return &DLayout; }
        static unsigned getModuleMatchQuality(const Module &M);

        // Pass Pipeline Configuration
        virtual bool addInstSelector(PassManagerBase &PM, bool Fast);
        virtual bool addPreEmitPass(PassManagerBase &PM, bool Fast);
    };

    
    llvm::Target& getThePantsTarget() {
        static llvm::Target ThePantsTarget;
        return ThePantsTarget;
    }
}

using namespace llvm;

extern "C" void LLVMInitializePantsTargetInfo() {
  RegisterTarget<Triple::pants, /*HasJIT=*/false>
    X(getThePantsTarget(), "pants", "Pants");
}

extern "C" void LLVMInitializePantsAsmPrinter() {
  RegisterAsmPrinter<PantsAsmPrinter> X(getThePantsTarget());
}
