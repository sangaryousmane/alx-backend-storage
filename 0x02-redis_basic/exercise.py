#!/usr/bin/env python3
""" Basic redis class
"""
import redis
import uuid
from typing import Union, Callable, Optional
from functools import wraps


class Cache:
    """ Basic redis class
    """

    def __init__(self):
        self._redis = redis.Redis()
        self._redis.flushdb()

    @staticmethod
    def count_calls(method: Callable) -> Callable:
        """ Measure the counts of each method
        """
        @wraps(method)
        def wrapper(self, *args, **kwargs):
            """ Inner function for incrementing
            """
            key = method.__qualname__
            self._redis.incr(key)
            return method(self, *args, **kwargs)
        return wrapper

    @count_calls
    def store(self, data: Union[str, bytes, int, float]) -> str:
        """Initial storage method
        """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(self, key: str,
            fn: Optional[Callable] = None) -> Union[str, bytes, int, float]:
        '''
            Get data from the cache.
        '''
        value = self._redis.get(key)
        if fn:
            value = fn(value)
        return value

    def get_str(self, key: str) -> Union[str, bytes]:
        """ Get string"""
        return self.get(key, fn=lambda x: int(x))

    def get_int(self, key: str) -> Union[int, bytes]:
        """ Get and return integer data"""
        return self.get(key, fn=lambda d: int(d))
