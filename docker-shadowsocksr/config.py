# -*- coding: utf-8 -*-
import json
import codecs
from string import Template


class ServerConfig(object):
    def __init__(self, config_path):
        self.__config_tmpl = ServerConfig.read_config(config_path)

    def describe_option(self, key):
        return 'default is: {default}\noptions: \n{options}'.format(
            default=self.__config_tmpl[key]['default'],
            options='\n'.join(['  ' + option for option in self.__config_tmpl[key]['candidates']])
        )

    def read_user_config(self):
        custom = dict()
        for key, val in self.__config_tmpl.items():
            print('What is the ' + key + ':')
            print(self.describe_option(key) + '')
            custom[key] = input('> ')
            if not custom.get(key, None):
                custom[key] = val
        return custom

    @staticmethod
    def read_config(path):
        with codecs.open(path, 'rb+', 'utf-8') as rf:
            user_config = json.load(rf)
        return user_config


def generate_prod_dockerfile(prod_path='Dockerfile.prod', config_tmpl_path='server-config.tmpl.json',
                             dockerfile_tmpl_path='Dockerfile.tmpl'):
    import pprint
    user_config = ServerConfig(config_tmpl_path).read_user_config()
    pprint.pprint(user_config)
    with codecs.open(dockerfile_tmpl_path, 'rb+', 'utf-8') as rf:
        dockerfile_template = Template(rf.read())
    with codecs.open(prod_path, 'wb+', 'utf-8') as wf:
        wf.write(dockerfile_template.safe_substitute(
            host=user_config['host'],
            port=user_config['port'],
            pwd=user_config['password'],
            method=user_config['method'],
            protocol=user_config['protocol'],
            obfs=user_config['obfs'],
            timeout=user_config['timeout']
        ))


if __name__ == '__main__':
    generate_prod_dockerfile()
