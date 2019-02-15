#!/usr/bin/env python3
from distutils.core import setup
from sys import version_info

if version_info[0] < 3:
    print("use python3 to install hello-python (e.g. pip3)")
    exit(1)

setup(
    name="hello-python",
    version="1.0.0",
    description="An example Python program",
    long_description="Hello Python!",
    author="Michael Williams",
    author_email="michael.williams@enspiral.com",
    url="https://github.com/SFTtech/sftdyn",
    license="GPL-3.0",
    packages=["hello_python"],
    scripts=["bin/hello-python"],
    data_files=[
    ],
    platforms=[
        'Linux',
    ],
    classifiers=[
        ("License :: OSI Approved :: "
         "GNU General Public License v3 or later (GPLv3+)"),
        "Intended Audience :: Developers"
    ],
)
