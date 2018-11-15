import os
import sys
from timeit import default_timer as timer


class TicToc():

    class TicTocInstance():

        def __init__(self, feature = None):
          """Create instance of TicTocInstance class."""
          self.start   = float('nan')
          self.end     = float('nan')
          self.elapsed = float('nan')
          self.feature = feature if feature is not None else "dummy tictoc"

        def tic(self):
          self.start = timer()

        def toc(self, msg, restart = False):
          """
          Report time elapsed since last call to tic().

          Optional arguments:
              restart - Boolean specifying whether to restart the timer
          """
          self.end     = timer()
          self.elapsed = self.end - self.start

          self.print_message(msg.format(feature_tested=self.feature, toc = str(self.elapsed)))
          if restart:
              self.start = timer()

        def tocvalue(self, restart = False):
          self.end     = timer()
          self.elapsed = self.end - self.start
          if restart:
              self.start = timer()
          return self.elapsed
          pass

        def print_message(self, msg):
          print(msg)
          pass



    def __init__(self, msg = None):
        """Create instance of TicToc class."""
        self.timers = [] # Stack of tictocinstances
        self.msg = msg if msg is not None else "TICTOC -- EXECUTION TIME for {feature_tested} took {toc} seconds"

    def tic(self, feature = None):
        """Start the timer."""
        t = self.TicTocInstance(feature)
        t.tic()
        self.timers.append(t)

    def toc(self, restart = False):
        """
        Report time elapsed since last call to tic().

        Optional arguments:
            restart - Boolean specifying whether to restart the timer
        """
        t = self.timers.pop()
        t.toc(self.msg, restart=restart)

        if restart is True:
          self.timers.append(t)

    def tocvalue(self, restart=False):
        """
        Return time elapsed since last call to tic().

        Optional argument:
            restart - Boolean specifying whether to restart the timer
        """
        t = self.timers.pop()
        tocvalue =  t.tocvalue(restart)
        if restart is True:
          self.timers.append(t)
        return tocvalue
