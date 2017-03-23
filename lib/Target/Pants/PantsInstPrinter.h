#ifndef LLVM_LIB_TARGET_PANTS_INSTPRINTER_PANTSINSTPRINTER_H
#define LLVM_LIB_TARGET_PANTS_INSTPRINTER_PANTSINSTPRINTER_H

#include "llvm/MC/MCInstPrinter.h"

namespace llvm {

class PantsInstPrinter : public MCInstPrinter {
public:
  PantsInstPrinter(const MCAsmInfo &MAI, const MCInstrInfo &MII,
                   const MCRegisterInfo &MRI)
      : MCInstPrinter(MAI, MII, MRI) {}

};
} // end namespace llvm

#endif
