# pyplusplus11
Python package using C++ code through pybind11

# Get this repo

```
git clone --recursive https://github.com/fvalenza/pyplusplus11
```

* Compile dummylib and source env.bashrc before any python related stuff

```
cd pyplusplus11/
source env.bashrc

cd external_libraries/dummylib
mkdir build && cd build
cmake ..
make install
```

* Locall install of python package
```
cd $PYPLUSPLUS11_HOME
python -m pip install --user .
```

* Run unittest
```
cd $PYPLUSPLUS11_HOME
python setup.py test
```