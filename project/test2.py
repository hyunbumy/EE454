from CompactFIPS202 import SHA3_256, Keccak
from ParallelHash import ParallelHash256_test, cSHAKE256_test
import binascii
import Util

input_string = bytearray("hello world!", encoding='utf-8')
print(binascii.hexlify(ParallelHash256_test(Util.to_bitstring(input_string), 5)))