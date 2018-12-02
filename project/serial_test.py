import serial

port = serial.Serial("/dev/ttyUSB1", baudrate=115200, timeout=3.0)

while True:
    # port.write("\r\nSay something:")
    rcv = port.read(256)
    # port.write("\r\nYou sent:" + repr(rcv))
    print(repr(rcv))