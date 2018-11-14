from CompactFIPS202 import SHAKE256, Keccak, SHA3_256
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


# Specific implementation that uses SHA3_256 for its underlying Keccak hashing
def cSHAKE256_test(X, L, N, S):
    payload = Util.bytepad((Util.encode_string(N) + Util.encode_string(S)), 136) + X + "00"
    # Convert bit string to bytearray
    payload = Util.to_bytearray(payload)
    # Refer to https://keccak.team/keccak_specs_summary.html
    return SHA3_256(payload)

# Specific implementation using 256 bits for output and no additive data
def ParallelHash256_test(X, B):
    n = ceil((len(X)/8) / 8)
    z = Util.left_encode(B)

    for i in range(n):
        # Convert bytearray to bit string
        z += Util.to_bitstring(cSHAKE256_test(X[i*B*8:(i+1)*B*8], 512, "", ""))
    z += Util.right_encode(n) + Util.right_encode(256)
    return cSHAKE256_test(z, 256, "ParallelHash", "")

# Refer to https://trac.cryptech.is/browser/core/hash/sha3/src/rtl