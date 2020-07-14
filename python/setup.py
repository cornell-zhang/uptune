from setuptools import setup

required = open('requirements.txt').read().splitlines()
required = [l.strip() for l in required
            if l.strip() and not l.strip().startswith('#')]

setup(name='uptune',
      version='2020.07',
      description='generic distributed auto-tuning framework',
      url='https://github.com/cornell-zhang/uptune',
      author='shaojie xiang',
      author_email='sx233@cornell.edu',
      packages=['uptune', 'uptune.opentuner', 'uptune.add', 'uptune.tuners', 
                'uptune.src', 'uptune.quickest',
                'uptune.template', 'uptune.database', 'uptune.plugins'],
      entry_points = {
          'console_scripts': ['ut=uptune.on:main'],
      },
      install_requires=required,
      zip_safe=False)
