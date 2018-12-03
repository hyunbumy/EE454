import serial
import time

port = serial.Serial("/dev/ttyUSB1", baudrate=4000000)

while (input("Please press enter to continue") is not ""):
    pass

start_time = time.time()

print(port.write(bytearray("\x00", encoding="utf-8")))
print(port.write(bytearray("abcd"*50, encoding="utf-8")))
rcv = port.read(32)

duration_long = time.time() - start_time

print(repr(rcv))
print("Time: {}s".format(duration_long))

# while True:
#     # port.write("\r\nSay something:")
#     rcv = port.read(256)
#     # port.write("\r\nYou sent:" + repr(rcv))
#     print(repr(rcv)