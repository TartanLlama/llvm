class PantsReg<string n> : Register<n> {
  let Namespace = "PA";
}

def R0 : PantsReg<"R0">, DwarfRegNum<[0]>;
def R1 : PantsReg<"R1">, DwarfRegNum<[1]>;
def R2 : PantsReg<"R2">, DwarfRegNum<[2]>;
def R3 : PantsReg<"R3">, DwarfRegNum<[3]>;
def R4 : PantsReg<"R4">, DwarfRegNum<[4]>;
def R5 : PantsReg<"R5">, DwarfRegNum<[5]>;
def R6 : PantsReg<"R6">, DwarfRegNum<[6]>;
def R7 : PantsReg<"R7">, DwarfRegNum<[7]>;
def R8 : PantsReg<"R8">, DwarfRegNum<[8]>;
def R9 : PantsReg<"R9">, DwarfRegNum<[9]>;
def R10 : PantsReg<"R10">, DwarfRegNum<[10]>;
def Rs : PantsReg<"Rs">, DwarfRegNum<[11]>;
def Sp : PantsReg<"Sp">, DwarfRegNum<[12]>;
def Fp : PantsReg<"Fp">, DwarfRegNum<[13]>;
def Pc : PantsReg<"Pc">, DwarfRegNum<[14]>;
def Sn : PantsReg<"Sn">, DwarfRegNum<[15]>;
def Me : PantsReg<"Me">, DwarfRegNum<[16]>;
def Ra : PantsReg<"Ra">, DwarfRegNum<[17]>;

def IntRegs : RegisterClass<"PA", [i32], 32,
    (add R0, R1, R2, R3, R4,
         R5, R6, R7, R8, R9, R10,
         Rs, Sp, Fp, Pc, Sn, Me, Ra)>;
