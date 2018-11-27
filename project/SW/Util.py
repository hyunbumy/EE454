from math import ceil, log2
from bitstring import BitArray

def encode(x):
    n = ceil(log2(x+1)/8) if x > 0 else 1
    z= ""
    for i in range(n):
        temp = x % 256
        temp = BitArray(uint=temp, length=8)
        temp.reverse()
        z += temp.bin
        x //= 256
    return z, n

def right_encode(x):
    z, n = encode(x)
    temp = BitArray(uint=n, length=8)
    temp.reverse()
    z += temp.bin
    return z

def left_encode(x):
    z, n = encode(x)
    temp = BitArray(uint=n, length=8)
    temp.reverse()
    z = temp.bin + z
    return z

def encode_string(S):
    S = ''.join(format(x, 'b') for x in bytearray(S, encoding='utf-8'))
    return left_encode(len(S)) + S

def bytepad(X, w):
    z = left_encode(w) + X

    while (len(z) % 8) != 0:
        z += '0'
    while (len(z)/8) % w != 0:
        z += "00000000"
    
    return z

def to_bitstring(b):
    return BitArray(bytes=b).bin

def to_bytearray(X):
    return int(X, 2).to_bytes((len(X) + 7) // 8, byteorder='big') if X is not '' else bytearray("", encoding='utf-8')