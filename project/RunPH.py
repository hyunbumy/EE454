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
    print(bytes.decode(binascii.hexlify(ParallelHash256(input_string, block_size))))

if __name__ == '__main__':
    main(sys.argv[1:])