from uptune.add import constraint

class bandit():
  def __init__(self, arg):
    pass

def model(name=None, weight=1):
    def decorator(function):
        # TODO: statistically checking the legality
        def wrapper(*args, **kwargs):
            func(*args, **kwargs)
        constraint.Schedule.rules.append(wrapper)
        return wrapper
    return decorator