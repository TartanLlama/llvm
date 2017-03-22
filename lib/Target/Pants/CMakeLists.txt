set(LLVM_TARGET_DEFINITIONS Pants.td)

add_llvm_target(LLVMPants
  PantsTargetMachine.cpp
  )
