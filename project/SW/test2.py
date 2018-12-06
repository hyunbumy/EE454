from CompactFIPS202 import SHA3_256, Keccak
from ParallelHash import ParallelHash256_test, cSHAKE256_test
import binascii
import Util

# input_string = bytearray("hello world!", encoding='utf-8')
# print(binascii.hexlify(ParallelHash256_test(Util.to_bitstring(input_string), 5)))

print(binascii.hexlify(SHA3_256(bytearray("", encoding='utf-8'))))
# print(binascii.hexlify(SHA3_256(bytearray("\x13", encoding='utf-8'))))
# print(binascii.hexlify(SHA3_256(bytearray("abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq", encoding='utf-8'))))
print(binascii.hexlify(SHA3_256(bytearray("abc", encoding='utf-8'))))
# print(binascii.hexlify(SHA3_256(Util.to_bytearray("011000010110001001100011"))))

# long_msg = bytearray(binascii.unhexlify("41FB"))
# print(binascii.hexlify(SHA3_256(long_msg)))#bytearray(long_msg, encoding='utf-8'))))
