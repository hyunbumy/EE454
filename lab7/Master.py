

class Master(object):
    def __init__(self, master_address, interconnect):
        self.address = master_address
        self.interconnect = interconnect

    def read(self, dest):
        return self.interconnect.read(dest)
    pass