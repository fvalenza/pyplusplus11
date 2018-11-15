# import `pybind1 extension module from subpackage and expose it
import expose_modB2 as cpp

def hello_python_modB2():
    print("Hello world from subpackB.modB2 !")
