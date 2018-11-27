from ParallelHash import ParallelHash256, cSHAKE256
import Util
import binascii
import CompactFIPS202

s = Util.to_bitstring(bytearray("hello world!", encoding='utf-8'))
print(bytes.decode(binascii.hexlify(ParallelHash256(s,5))))

s = bytearray(binascii.unhexlify("000102030405060710111213141516172021222324252627"))
s = Util.to_bitstring(s)
print(bytes.decode(binascii.hexlify(ParallelHash256(s, 8))))

print(cSHAKE256(s, 256, "", ""))
print(CompactFIPS202.SHAKE256(bytearray("hello world!", encoding='utf-8'), 256//8))

b = bytearray("hello world!", encoding='utf-8')
print(b)