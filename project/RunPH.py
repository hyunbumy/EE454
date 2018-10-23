from ParallelHash import ParallelHash256

import Util
import binascii
import sys


def main(argv):
    """
    python RunPH.py [inputString] [blockSize]
    """
    input_string = Util.to_bitstring(bytearray(argv[0], encoding='utf-8'))
    block_size = int(argv[1])

    # print(input_string, block_size)
    result_hex = binascii.hexlify(ParallelHash256(input_string, block_size))
    print("Input String: {}".format(argv[0]))
    print("ParallelHash: {}".format(bytes.decode(result_hex)))

if __name__ == '__main__':
    main(sys.argv[1:])