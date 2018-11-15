import os
import sys



class Module1:

    def __init__(self):
      self.name = "package1.module1"

    def __del__(self):
      # # Ensure to close NetCDF dataset if they haven't been close before
      #  In case an exception occurs before the I/O files are created, the following line will return exception
      #  Currently with no "clean" way to free I/O memory, there could be memory leaks ??
      #  see https://stackoverflow.com/questions/865115/how-do-i-correctly-clean-up-a-python-object to improve code ?
      # self.close_io_files()
      pass

    def display_name(self):
      print("My name is " + self.name)
      pass

    def run(self):
        self.display_name()