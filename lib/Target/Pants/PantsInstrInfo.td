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

class PAr2<string OpcStr, SDNode OpNode, RegisterClass RC, ValueType Ty>
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



def ADD : PAr3<"add", add, IntRegs, i32>;
def SUB : PAr3<"sub", sub, IntRegs, i32>;
def MUL : PAr3<"mul", mul, IntRegs, i32>;
def DIV : PAr3<"div", udiv, IntRegs, i32>;
def AND : PAr3<"and", and, IntRegs, i32>;
def OR  : PAr3<"or", or, IntRegs, i32>;
//def COMPARE : PAr3<"compare", compare, IntRegs, i32>;

//def NOT : PAr2<"not", not, IntRegs, i32>;

def CPY : PAr1<"copy", IntRegs, i32>;
def LOAD : PAr1<"load", IntRegs, i32>;
def STORE : PAr1<"store", IntRegs, i32>;
def BRANCH : PAr1<"branch", IntRegs, i32>;

def SET : InstPA<(outs IntRegs:$rd), (ins i32imm:$imm),
                 "set $rd $imm",
                 []>;

def JUMP : PA0<"jump">;
def CALL : PA0<"call">;
def HALT : PA0<"halt">;
