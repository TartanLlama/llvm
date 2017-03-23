//===----------------------------------------------------------------------===//
// Target-independent interfaces which we are implementing
//===----------------------------------------------------------------------===//

include "llvm/Target/Target.td"

//===----------------------------------------------------------------------===//
// Descriptions
//===----------------------------------------------------------------------===//

include "PANTSRegisterInfo.td"
include "PANTSInstrInfo.td"
include "PANTSCallingConv.td"

def PANTSInstrInfo : InstrInfo;

//===----------------------------------------------------------------------===//
// PANTS processors supported.
//===----------------------------------------------------------------------===//

class Proc<string Name, list<SubtargetFeature> Features>
    : Processor<Name, NoItineraries, Features>;

def : Proc<"generic", []>;

//===----------------------------------------------------------------------===//
// Declare the target which we are implementing
//===----------------------------------------------------------------------===//

def PANTS : Target {
  let InstructionSet = PANTSInstrInfo;
}
