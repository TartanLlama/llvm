set(LLVM_TARGET_DEFINITIONS Pants.td)

tablegen(LLVM PantsGenRegisterInfo.inc -gen-register-info)
tablegen(LLVM PantsGenInstrInfo.inc -gen-instr-info)
tablegen(LLVM PantsGenCallingConv.inc -gen-callingconv)
add_public_tablegen_target(PantsCommonTableGen)

add_llvm_target(PantsCodeGen
  PantsTargetMachine.cpp
  PantsInstPrinter.cpp      
  PantsRegisterInfo.cpp
  )
