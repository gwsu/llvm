//=- AArch64SchedFalkorWrRes.td - Falkor Write Res ---*- tablegen -*-=//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Contains all of the Falkor specific SchedWriteRes types. The approach
// below is to define a generic SchedWriteRes for every combination of
// latency and microOps. The naming conventions is to use a prefix, one field
// for latency, and one or more microOp count/type designators.
//   Prefix: FalkorWr
//   MicroOp Count/Types: #(B|X|Y|Z|LD|ST|SD|VX|VY|VSD)
//   Latency: #cyc
//
// e.g. FalkorWr_1Z_6SD_4VX_6cyc means there are 11 micro-ops to be issued
//      down one Z pipe, six SD pipes, four VX pipes and the total latency is
//      six cycles.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Define 1 micro-op types


def FalkorWr_1X_2cyc    : SchedWriteRes<[FalkorUnitX]>   { let Latency = 2; }
def FalkorWr_1X_4cyc    : SchedWriteRes<[FalkorUnitX]>   { let Latency = 4; }
def FalkorWr_1X_5cyc    : SchedWriteRes<[FalkorUnitX]>   { let Latency = 5; }
def FalkorWr_1Z_1cyc    : SchedWriteRes<[FalkorUnitZ]>   { let Latency = 1; }
def FalkorWr_1Z_2cyc    : SchedWriteRes<[FalkorUnitZ]>   { let Latency = 2; }
def FalkorWr_1ZB_1cyc   : SchedWriteRes<[FalkorUnitZB]>  { let Latency = 1; }
def FalkorWr_1LD_3cyc   : SchedWriteRes<[FalkorUnitLD]>  { let Latency = 3; }
def FalkorWr_1LD_4cyc   : SchedWriteRes<[FalkorUnitLD]>  { let Latency = 4; }
def FalkorWr_1XYZ_1cyc  : SchedWriteRes<[FalkorUnitXYZ]> { let Latency = 1; }
def FalkorWr_1XYZ_2cyc  : SchedWriteRes<[FalkorUnitXYZ]> { let Latency = 2; }
def FalkorWr_1XYZB_1cyc : SchedWriteRes<[FalkorUnitXYZB]>{ let Latency = 1; }

def FalkorWr_1VXVY_1cyc : SchedWriteRes<[FalkorUnitVXVY]>{ let Latency = 1; }
def FalkorWr_1VXVY_2cyc : SchedWriteRes<[FalkorUnitVXVY]>{ let Latency = 2; }
def FalkorWr_1VXVY_3cyc : SchedWriteRes<[FalkorUnitVXVY]>{ let Latency = 3; }
def FalkorWr_1VXVY_4cyc : SchedWriteRes<[FalkorUnitVXVY]>{ let Latency = 4; }
def FalkorWr_1VXVY_5cyc : SchedWriteRes<[FalkorUnitVXVY]>{ let Latency = 5; }
def FalkorWr_1VXVY_6cyc : SchedWriteRes<[FalkorUnitVXVY]>{ let Latency = 6; }

def FalkorWr_1LD_1cyc   : SchedWriteRes<[FalkorUnitLD]>  { let Latency = 1; }
def FalkorWr_1ST_1cyc   : SchedWriteRes<[FalkorUnitST]>  { let Latency = 1; }

//===----------------------------------------------------------------------===//
// Define 2 micro-op types

def FalkorWr_2VXVY_1cyc   : SchedWriteRes<[FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 1;
  let NumMicroOps = 2;
}
def FalkorWr_2VXVY_2cyc   : SchedWriteRes<[FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 2;
  let NumMicroOps = 2;
}
def FalkorWr_2VXVY_3cyc   : SchedWriteRes<[FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 3;
  let NumMicroOps = 2;
}
def FalkorWr_2VXVY_4cyc   : SchedWriteRes<[FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 4;
  let NumMicroOps = 2;
}
def FalkorWr_2VXVY_5cyc   : SchedWriteRes<[FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 5;
  let NumMicroOps = 2;
}
def FalkorWr_2VXVY_6cyc   : SchedWriteRes<[FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 6;
  let NumMicroOps = 2;
}

def FalkorWr_1LD_1VXVY_4cyc : SchedWriteRes<[FalkorUnitLD, FalkorUnitVXVY]> {
  let Latency = 4;
  let NumMicroOps = 2;
}
def FalkorWr_1XYZ_1LD_4cyc  : SchedWriteRes<[FalkorUnitXYZ, FalkorUnitLD]> {
  let Latency = 4;
  let NumMicroOps = 2;
}
def FalkorWr_2LD_3cyc   : SchedWriteRes<[FalkorUnitLD, FalkorUnitLD]> {
  let Latency = 3;
  let NumMicroOps = 2;
}


def FalkorWr_1VY_1VX_3cyc : SchedWriteRes<[FalkorUnitVY, FalkorUnitVX]> {
  let Latency = 3;
  let NumMicroOps = 2;
}
def FalkorWr_1VY_1VX_5cyc : SchedWriteRes<[FalkorUnitVY, FalkorUnitVX]> {
  let Latency = 5;
  let NumMicroOps = 2;
}

def FalkorWr_1VX_1VY_2cyc : SchedWriteRes<[FalkorUnitVX, FalkorUnitVY]> {
  let Latency = 2;
  let NumMicroOps = 2;
}

def FalkorWr_1VX_1VY_10cyc : SchedWriteRes<[FalkorUnitVX, FalkorUnitVY]> {
  let Latency = 10;
  let NumMicroOps = 2;
}

def FalkorWr_1XYZ_1ST_4cyc: SchedWriteRes<[FalkorUnitXYZ, FalkorUnitST]> {
  let Latency = 4;
  let NumMicroOps = 2;
}
def FalkorWr_1XYZ_1LD_5cyc: SchedWriteRes<[FalkorUnitXYZ, FalkorUnitLD]> {
  let Latency = 5;
  let NumMicroOps = 2;
}

def FalkorWr_2XYZ_2cyc   : SchedWriteRes<[FalkorUnitXYZ, FalkorUnitXYZ]> {
  let Latency = 2;
  let NumMicroOps = 2;
}

def FalkorWr_1LD_1Z_3cyc : SchedWriteRes<[FalkorUnitLD, FalkorUnitZ]> {
  let Latency = 3;
  let NumMicroOps = 2;
}

//===----------------------------------------------------------------------===//
// Define 3 micro-op types

def FalkorWr_3VXVY_3cyc : SchedWriteRes<[FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 3;
  let NumMicroOps = 3;
}
def FalkorWr_3VXVY_4cyc : SchedWriteRes<[FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 4;
  let NumMicroOps = 3;
}
def FalkorWr_3VXVY_5cyc : SchedWriteRes<[FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 5;
  let NumMicroOps = 3;
}
def FalkorWr_3VXVY_6cyc : SchedWriteRes<[FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 6;
  let NumMicroOps = 3;
}

def FalkorWr_1LD_2VXVY_4cyc  : SchedWriteRes<[FalkorUnitLD, FalkorUnitVXVY]> {
  let Latency = 4;
  let NumMicroOps = 3;
}
def FalkorWr_2LD_1none_3cyc  : SchedWriteRes<[FalkorUnitLD, FalkorUnitLD]> {
  let Latency = 3;
  let NumMicroOps = 3;
}
def FalkorWr_3LD_3cyc        : SchedWriteRes<[FalkorUnitLD, FalkorUnitLD,
                                              FalkorUnitLD]> {
  let Latency = 3;
  let NumMicroOps = 3;
}

def FalkorWr_2LD_1Z_3cyc     : SchedWriteRes<[FalkorUnitLD, FalkorUnitLD,
                                             FalkorUnitZ]> {
  let Latency = 3;
  let NumMicroOps = 3;
}
def FalkorWr_1LD_1ST_1SD_3cyc: SchedWriteRes<[FalkorUnitLD, FalkorUnitST,
                                              FalkorUnitSD]> {
  let Latency = 3;
  let NumMicroOps = 3;
}

//===----------------------------------------------------------------------===//
// Define 4 micro-op types

def FalkorWr_2VX_2VY_2cyc  : SchedWriteRes<[FalkorUnitVX, FalkorUnitVY,
                                            FalkorUnitVX, FalkorUnitVY]> {
  let Latency = 2;
  let NumMicroOps = 4;
}

def FalkorWr_4VXVY_2cyc    : SchedWriteRes<[FalkorUnitVXVY, FalkorUnitVXVY,
                                            FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 2;
  let NumMicroOps = 4;
}
def FalkorWr_4VXVY_3cyc    : SchedWriteRes<[FalkorUnitVXVY, FalkorUnitVXVY,
                                            FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 3;
  let NumMicroOps = 4;
}
def FalkorWr_4VXVY_4cyc    : SchedWriteRes<[FalkorUnitVXVY, FalkorUnitVXVY,
                                            FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 4;
  let NumMicroOps = 4;
}
def FalkorWr_4VXVY_6cyc    : SchedWriteRes<[FalkorUnitVXVY, FalkorUnitVXVY,
                                            FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 6;
  let NumMicroOps = 4;
}

def FalkorWr_4LD_3cyc      : SchedWriteRes<[FalkorUnitLD, FalkorUnitLD,
                                            FalkorUnitLD, FalkorUnitLD]> {
  let Latency = 3;
  let NumMicroOps = 4;
}

def FalkorWr_1LD_1ST_1SD_1LD_3cyc: SchedWriteRes<[FalkorUnitLD, FalkorUnitST,
                                                  FalkorUnitSD, FalkorUnitLD]> {
  let Latency = 3;
  let NumMicroOps = 4;
}

//===----------------------------------------------------------------------===//
// Define 5 micro-op types

def FalkorWr_1LD_4VXVY_4cyc: SchedWriteRes<[FalkorUnitLD, FalkorUnitVXVY,
                                            FalkorUnitVXVY, FalkorUnitVXVY,
                                            FalkorUnitVXVY]> {
  let Latency = 4;
  let NumMicroOps = 5;
}
def FalkorWr_2LD_2VXVY_4cyc: SchedWriteRes<[FalkorUnitLD, FalkorUnitLD,
                                            FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 4;
  let NumMicroOps = 5;
}
def FalkorWr_5VXVY_7cyc    : SchedWriteRes<[FalkorUnitVXVY, FalkorUnitVXVY,
                                            FalkorUnitVXVY, FalkorUnitVXVY,
                                            FalkorUnitVXVY]> {
  let Latency = 7;
  let NumMicroOps = 5;
}

//===----------------------------------------------------------------------===//
// Define 6 micro-op types

def FalkorWr_2LD_2VXVY_2none_4cyc: SchedWriteRes<[FalkorUnitLD, FalkorUnitLD,
                                            FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 4;
  let NumMicroOps = 6;
}

//===----------------------------------------------------------------------===//
// Define 8 micro-op types

def FalkorWr_2LD_2VXVY_2LD_2VXVY_4cyc:SchedWriteRes<[FalkorUnitLD, FalkorUnitLD,
                                             FalkorUnitVXVY, FalkorUnitVXVY,
                                             FalkorUnitLD, FalkorUnitLD,
                                             FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 4;
  let NumMicroOps = 8;
}

//===----------------------------------------------------------------------===//
// Define 9 micro-op types

def FalkorWr_2LD_2VXVY_1XYZ_2LD_2VXVY_4cyc:SchedWriteRes<[FalkorUnitLD,
                                             FalkorUnitLD, FalkorUnitVXVY,
                                             FalkorUnitVXVY, FalkorUnitXYZ,
                                             FalkorUnitLD, FalkorUnitLD,
                                             FalkorUnitVXVY, FalkorUnitVXVY]> {
  let Latency = 4;
  let NumMicroOps = 9;
}
