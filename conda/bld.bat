rm -rf build
mkdir build
cd build
cmake ..
make -j4
./uptune_tests

cd ../python
"%PYTHON%" setup.py install setup.py install --single-version-externally-managed --record=record.txt
cd ../
if errorlevel 1 exit 1
