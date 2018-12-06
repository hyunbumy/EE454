import serial

port = serial.Serial("/dev/ttyUSB1", baudrate=4000000)

while (input("Please press enter to continue") is not ""):
    pass

print(port.write(bytearray("\x00", encoding="utf-8")))
print(port.write(bytearray("zyxwa"*40, encoding="utf-8")))
rcv = port.read(32)

print(repr(rcv))
