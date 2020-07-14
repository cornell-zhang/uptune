import os
from setuptools import setup

required = open('requirements.txt').read().splitlines()
required = [l.strip() for l in required
            if l.strip() and not l.strip().startswith('#')]

# Include extern ip files
if os.path.exists("MANIFEST.in"):
    os.remove("MANIFEST.in")

CURRENT_DIR = os.path.dirname(__file__)
EXTERN_IP_DIR = os.path.join(CURRENT_DIR, "uptune/quickest")
with open("MANIFEST.in", "w") as fp:
    for subdir, dirs, files in os.walk(EXTERN_IP_DIR):
        for file_name in files:
            if not (file_name.endswith(".pyc") or file_name.endswith(".py")):
                filepath = subdir + os.sep + file_name
                fp.write("include {}\n".format(filepath))

setup(name='uptune',
      version='2020.07',
      description='generic distributed auto-tuning framework',
      url='https://github.com/cornell-zhang/uptune',
      author='shaojie xiang',
      author_email='sx233@cornell.edu',
      packages=['uptune', 'uptune.opentuner', 'uptune.add', 'uptune.tuners', 
                'uptune.src', 'uptune.quickest',
                'uptune.opentuner.measurement', 'uptune.opentuner.resultsdb',
                'uptune.opentuner.search', 'uptune.opentuner.utils',
                'uptune.template', 'uptune.database', 'uptune.plugins'],
      entry_points = {
          'console_scripts': ['ut=uptune.on:main'],
      },
      install_requires=required,
      zip_safe=False)
