import sys
if sys.version_info[0] == 2:
  import unittest2 as unittest
else:
  import unittest as unittest
# import `pybind1extension module from subpackage
from pyplusplus11.packageA.subpackB.modB2 import modB2

class MainTest(unittest.TestCase):
    def test_sub(self):
        # test that 1 + 1 = 2
        self.assertEqual(modB2.cpp.sub(3, 1), 2)
        pass

if __name__ == '__main__':
    unittest.main()
