from CompactFIPS202 import SHAKE256, Keccak
from math import ceil
import Util


# Refer to https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-185.pdf

def cSHAKE256(X, L, N, S):
    if N is "" and S is "":
        # Convert to bytearray
        X = Util.to_bytearray(X)
        return SHAKE256(X, L//8)
    else:
        payload = Util.bytepad((Util.encode_string(N) + Util.encode_string(S)), 136) + X + "00"
        # Convert bit string to bytearray
        payload = Util.to_bytearray(payload)
        # Refer to https://keccak.team/keccak_specs_summary.html
        return Keccak(1088, 512, payload, 0x04, L//8)

def ParallelHash256(X, B, L=256, S=""):
    n = ceil((len(X)/8) / 8)
    z = Util.left_encode(B)

    for i in range(n):
        # Convert bytearray to bit string
        z += Util.to_bitstring(cSHAKE256(X[i*B*8:(i+1)*B*8], 512, "", ""))
    z += Util.right_encode(n) + Util.right_encode(L)
    return cSHAKE256(z, L, "ParallelHash", S)