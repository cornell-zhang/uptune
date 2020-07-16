set -e
set -u

rm -rf build
mkdir build
cd build
cmake ..
make -j4
./uptune_tests

git clone https://github.com/kachayev/fn.py.git
cd fn.py
$PYTHON setup.py install --single-version-externally-managed --record=record.txt
cd ../

cd ../python
$PYTHON setup.py install --single-version-externally-managed --record=record.txt
cd ../
