Tuning ABC (logic synthesis) synthesis flow - Exmaple Single Stage
====================

#### Bug report

```
python -m uptune.on abc.py -pf 1 --time_out 360
```
Traceback (most recent call last):
  File "/usr/local/Cellar/python/3.7.4/Frameworks/Python.framework/Versions/3.7/lib/python3.7/runpy.py", line 193, in _run_module_as_main
    "__main__", mod_spec)
  File "/usr/local/Cellar/python/3.7.4/Frameworks/Python.framework/Versions/3.7/lib/python3.7/runpy.py", line 85, in _run_code
    exec(code, run_globals)
  File "/Users/cunxiyu/Desktop/Research_Group/tools/uptune/uptune/on.py", line 144, in <module>
    on.main()
AttributeError: 'int' object has no attribute 'main'

