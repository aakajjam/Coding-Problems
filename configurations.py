# This file is part of the Udemy Course: Learn API Automation Testing Python BDD Framework
import configparser


def getConfig():
    config = configparser.ConfigParser()
    config.read('utilities/properties.ini')
    return config

# This is reading our .ini file and returnig config