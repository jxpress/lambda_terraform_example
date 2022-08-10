# coding: utf-8
import requests

from worker_lib.common import hoge


def handler(event, context):
    print('start export_api_log')
    res = requests.get('https://example.com')
    hoge()
    print(res.text)