#!/usr/bin/env python3
""" List all documents base on the pymongo
collection as parameter
"""


def list_all(mongo_collection):
    """ List all documents base on the pymongo
    collection as parameter"""

    documents = mongo_collection.find({})
    return [document for document in documents]
