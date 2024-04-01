#!/usr/bin/env python3
""" Basic redis class
"""
import redis
import uuid
from typing import Union, Callable


class Cache:
    """ Basic redis class
    """

    def __init__(self):
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """Initial storage method
        """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(self, key: str, fn: Callable = None) -> Union[str, bytes, int, float]:
        """ Get and return data"""
        data = self._redis.get(key)

        if data is None:
            return None
        if fn is not None:
            return fn(data)
        return data

    def get_str(self, key: str) -> Union[str, bytes]:
        """ Get string"""
        return self.get(key, fn=lambda x: int(x))

    def get_int(self, key: str) -> Union[int, bytes]:
        """ Get and return integer data"""
        return self.get(key, fn=lambda d: int(d))
