 
import unittest
import subprocess
import os

class MainTest(unittest.TestCase):
    def test_cpp(self):
        print("\n\nTesting C++ code...")
        subprocess.check_call(os.path.join(os.path.dirname(
            os.path.relpath(__file__)), 'bin', 'modB1_test'))
        subprocess.check_call(os.path.join(os.path.dirname(
            os.path.relpath(__file__)), 'bin', 'modB2_test'))
        print()  # for prettier output


if __name__ == '__main__':
    unittest.main()
