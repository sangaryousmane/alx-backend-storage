#!/usr/bin/env python3
""" changes all topics of a school document based on the name
"""


def updat_topics(mongo_collection, name, topics):
    """ changes all topics of a school document based on the name"""
    updated = mongo_collection.update_many(
            {"name": name}, {$set: {"topics": topics}})
    return updated.modified_count
