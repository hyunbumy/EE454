from CompactFIPS202 import SHA3_256
from ParallelHash import ParallelHash256, ParallelHash256_test
import binascii
import Util
import time

total = 0

for i in range(100):
    print("Test {}".format(i+1))

    # Empty msg
    in_data = bytearray("", encoding='utf-8')
    start_time = time.time()
    res = SHA3_256(in_data)
    duration_empty = time.time() - start_time
    print("Empty: {}s".format(duration_empty))

    # Short msg
    in_data = bytearray("abc", encoding='utf-8')
    start_time = time.time()
    res = SHA3_256(in_data)
    duration_short = time.time() - start_time
    print("Short: {}s".format(duration_short))

    # Long msg
    in_data = bytearray("\xa3"*200, encoding='utf-8')
    start_time = time.time()
    res = SHA3_256(in_data)
    duration_long = time.time() - start_time
    print("Long: {}s".format(duration_long))

    temp = duration_empty + duration_short + duration_long

    print("Total: {}s".format(temp))
    print("")

    total += temp

print("Sum: {}s".format(total))

print("")

t = bytearray("\xa3"*1000, encoding='utf-8')
start_time = time.time()
SHA3_256(t)
duration = time.time()-start_time
print("SHA3: {}s".format(duration))

s = Util.to_bitstring(bytearray("\xa3"*1000, encoding='utf-8'))
start_time = time.time()
ParallelHash256(s, 8)
duration = time.time() - start_time
print("Parallel: {}s".format(duration))
