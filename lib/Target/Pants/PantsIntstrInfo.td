class InstPA<dag outs, dag ins, string asmstr, list<dag> pattern,
             InstrItinClass itin = NoItinerary>
   : Instruction {
  let Namespace = "PA";
  let Size = 4;

  dag OutOperandList = outs;
  dag InOperandList = ins;
  let AsmString   = asmstr;
  let Pattern = pattern;

  let DecoderNamespace = "Pants";

  let Itinerary = itin;
}

class PAr3<string OpcStr, SDNode OpNode, RegisterClass RC, ValueType Ty>
    : InstPA<(outs RC:$rd), (ins RC:$rs1, RC:$rs2),
             !strconcat(OpcStr, " $rd $rs1 $rs2"),
             [(set Ty:$rd, (OpNode Ty:$rs1, Ty:$rs2))]>;

class PAr2<string OpcStr, RegisterClass RC, ValueType Ty>
    : InstPA<(outs RC:$rd), (ins RC:$rs1),
             !strconcat(OpcStr, " $rd $rs1"),
             [(set Ty:$rd, (OpNode Ty:$rs1))]>;

class PAr1<string OpcStr, RegisterClass RC, ValueType Ty>
    : InstPA<(outs), (ins RC:$rs1),
             !strconcat(OpcStr, " $rs1"),
             []>;


class PA0<string OpcStr>
    : InstPA<(outs), (ins),
             OpcStr,
             []>;



def ADD : PAr3<"add", add, IntReg, i32>;
def SUB : PAr3<"sub", sub, IntReg, i32>;
def MUL : PAr3<"mul", mul, IntReg, i32>;
def DIV : PAr3<"div", div, IntReg, i32>;
def AND : PAr3<"and", and, IntReg, i32>;
def OR  : PAr3<"or", or, IntReg, i32>;
def COMPARE : PAr3<"compare", compare, IntReg, i32>;

def NOT : PAr2<"not", IntReg, i32>;

def COPY : PAr1<"copy", IntReg, i32>;
def LOAD : PAr1<"load", IntReg, i32>;
def STORE : PAr1<"store", IntReg, i32>;
def BRANCH : PAr1<"branch", IntReg, i32>;

def SET : InstPA<(outs IntReg:$rd), (ins i32:$imm),
                 "set $rd $imm",
                 []>;

def JUMP : InstPA0<"jump">;
def CALL : InstPA0<"call">;
def HALT : InstPA0<"halt">;
