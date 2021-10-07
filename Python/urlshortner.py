import urllib
import requests
import json


def shorten(link):
    key = '' # Your cutt.ly Api Key Here 
    url = urllib.parse.quote(link)
    r = requests.get(f'http://cutt.ly/api/api.php?key={key}&short={url}')
    y = json.loads(r.text)
    return y['url']['shortLink']

print(shorten("https://github.com/"))
