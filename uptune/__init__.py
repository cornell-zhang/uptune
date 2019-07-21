from __future__ import absolute_import

from . import api
from . import opentuner
from .template.tuneapi import autotune
from .get_result import save, feedback, interm

def argparsers():
    """
    return a list of ArguementParser to be used as parents to the user's
    """
    return [
        opentuner.measurement.driver.argparser,
        opentuner.measurement.interface.argparser,
        opentuner.search.driver.argparser,
        opentuner.search.plugin.argparser,
        opentuner.search.technique.argparser,
        opentuner.tuningrunmain.argparser,
        api.argparser,
      ]


def default_argparser():
    import argparse
    return argparse.ArgumentParser(parents=argparsers())

