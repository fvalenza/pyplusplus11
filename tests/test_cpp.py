 
import unittest
import subprocess
import os



def str_to_bool(s):
  if s == 'True':
       return True
  elif s == 'False':
       return False
  else:
       raise ValueError("Cannot convert env var PYPLUSPLUS11_PYTEST_RUN_CPP_TESTS to boolean ( not True or False )")


PYTEST_RUN_CPP_TESTS = str_to_bool(os.environ["PYPLUSPLUS11_PYTEST_RUN_CPP_TESTS"])


def CPP_TEST_MODULE(mod):
  if PYTEST_RUN_CPP_TESTS:
    print()
    subprocess.check_call(os.path.join(os.path.dirname(
            os.path.relpath(__file__)), 'bin', 'modB1_test'))

class MainTest(unittest.TestCase):
    def test_cpp(self):
        # print("\n\nTesting C++ code...")
        CPP_TEST_MODULE('modB1_test')
        CPP_TEST_MODULE('modB2_test')


if __name__ == '__main__':
    unittest.main()
