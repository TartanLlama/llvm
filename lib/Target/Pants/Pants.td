//===----------------------------------------------------------------------===//
// Target-independent interfaces which we are implementing
//===----------------------------------------------------------------------===//

include "llvm/Target/Target.td"

//===----------------------------------------------------------------------===//
// Descriptions
//===----------------------------------------------------------------------===//

include "PantsRegisterInfo.td"
include "PantsInstrInfo.td"
include "PantsCallingConv.td"

def PantsInstrInfo : InstrInfo;

//===----------------------------------------------------------------------===//
// Pants processors supported.
//===----------------------------------------------------------------------===//

class Proc<string Name, list<SubtargetFeature> Features>
    : Processor<Name, NoItineraries, Features>;

def : Proc<"generic", []>;

//===----------------------------------------------------------------------===//
// Declare the target which we are implementing
//===----------------------------------------------------------------------===//

def Pants : Target {
  let InstructionSet = PantsInstrInfo;
}
