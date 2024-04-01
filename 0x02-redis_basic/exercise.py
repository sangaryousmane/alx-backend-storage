#!/usr/bin/env python3
""" Basic redis class
"""
import redis
import uuid
from typing import Union


class Cache:
    """ Basic redis class
    """

    def __init__(self):
        self._redis = resid.Redis()
        self._redis.flushdb()

    def store(self, data: Union[int, bytes, str, float]):
        """Initial storage method
        """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
