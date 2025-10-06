import re
from selenium import webdriver
from robot.libraries.BuiltIn import BuiltIn

class Utils:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def __init__(self):
        pass

    @staticmethod
    def set_firefox_proxy(proxyserver):
        
        pattern_ip = 'http[s]{0,1}\:\/\/([^\:]*).*'
        pattern_port = 'http[s]{0,1}\:\/\/[^\:]*\:(\d+)'
        proxy_ip=""
        proxy_port=0
        if(len(re.search(pattern_ip, proxyserver).groups()) > 0):
            proxy_ip=re.search(pattern_ip, proxyserver).group(1)

        if(len(re.search(pattern_port, proxyserver).groups()) > 0):
            proxy_port=int(re.search(pattern_port, proxyserver).group(1))

        BuiltIn().log_to_console("Setting firefox proxy " + proxyserver + ", ip: "+ proxy_ip +", port: " + str(proxy_port))

        profile = webdriver.FirefoxProfile()
        profile.set_preference('network.proxy.http', proxy_ip)
        profile.set_preference('network.proxy.http_port', proxy_port)
        profile.set_preference('network.proxy.ssl', proxy_ip)
        profile.set_preference('network.proxy.ssl_port', proxy_port)
        profile.set_preference('network.proxy.type', 1)
        profile.update_preferences()
        return profile