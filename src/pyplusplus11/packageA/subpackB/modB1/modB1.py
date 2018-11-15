# import `pybind1 extension module from subpackage and expose it
import expose_modB1 as cpp

def hello_python_modB1():
    print("Hello world from subpackB.modB1 !")
