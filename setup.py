from setuptools import setup

required = open('requirements.txt').read().splitlines()
required = [l.strip() for l in required
            if l.strip() and not l.strip().startswith('#')]

setup(name='uptune',
      version='0.1',
      description='user-defineable and parallelizable auto-tuning infrastructure',
      url='https://github.com/cornell-zhang/uptune',
      author='Shaojie Xiang',
      author_email='sx233@cornell.edu',
      packages=['uptune', 'uptune.opentuner', 'uptune.opentuner.resultsdb', 'uptune.opentuner.utils',
                'uptune.opentuner.measurement', 'uptune.opentuner.search', 'uptune.utils',
                'uptune.template', 'uptune.globaldb', 'uptune.plugins'],
      entry_points = {
          'console_scripts': ['uptune=uptune.on:main'],
      },
      install_requires=required,
      zip_safe=False)
