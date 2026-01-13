import rand

#include "TestU01.h"
#flag -I./TestU01-1.2.3/include -I./TestU01-1.2.3/testu01
#flag -L./TestU01-1.2.3/testu01/.libs -L./TestU01-1.2.3/probdist/.libs -L./TestU01-1.2.3/mylib/.libs
#flag -ltestu01 -lprobdist -lmylib -lm

/*
fn rdrand() u64 {
	mut value := u64(0)
	asm amd64 {
		rdrand value
		; =c (value)
	}
	return value
}
*/

// always 32bit
fn rdrand() u32 {
	return rand.u32()
}

@[typedef]
struct C.unif01_Gen{}

fn C.unif01_CreateExternGen01(charptr, voidptr) &C.unif01_Gen
fn C.unif01_CreateExternGenBits(charptr, voidptr) &C.unif01_Gen
fn C.bbattery_SmallCrush(&C.unif01_Gen)
fn C.bbattery_Crush(&C.unif01_Gen)
fn C.bbattery_BigCrush(&C.unif01_Gen)

fn main() {
	v := C.unif01_CreateExternGenBits('rdrand CPU'.str, voidptr(rdrand))
	C.bbattery_SmallCrush(v)
}
