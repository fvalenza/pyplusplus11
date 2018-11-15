import unittest
# import our `pybind11`-based extension module from package python_cpp_example
from pyplusplus11.packageA.subpackB.modB1 import modB1

class MainTest(unittest.TestCase):
    def test_add(self):
        # test that 1 + 1 = 2
        self.assertEqual(modB1.cpp.add(1, 1), 2)


if __name__ == '__main__':
    unittest.main()
