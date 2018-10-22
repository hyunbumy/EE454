from CompactFIPS202 import SHAKE256, Keccak
from math import ceil
import Util


# Refer to https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-185.pdf

def cSHAKE256(X, L, N, S):
    if N is "" and S is "":
        # Convert to bytearray
        X = int(X, 2).to_bytes((len(X) + 7) // 8, byteorder='big')
        return SHAKE256(X, L//8)
    else:
        payload = Util.bytepad((Util.encode_string(N) + Util.encode_string(S)), 136) + X + "00"
        # Convert to bytearray
        payload = int(payload, 2).to_bytes((len(payload) + 7) // 8, byteorder='big')
        # Refer to https://keccak.team/keccak_specs_summary.html
        return Keccak(1088, 512, payload, 0x04, L//8)

def ParallelHash256(X, B, L=256, S=""):
    n = ceil((len(X)/8) / 8)
    z = Util.left_encode(B)

    for i in range(n):
        z += bin(int.from_bytes(cSHAKE256(X[i*B*8:(i+1)*B*8], 512, "", ""), byteorder='big')).strip('0b')
    z += Util.right_encode(n) + Util.right_encode(L)
    return cSHAKE256(z, L, "ParallelHash", S)