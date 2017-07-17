'''
Created on 2017-7-2

@author: Demon Hunter
'''
# -*- coding: utf-8 -*- 
import re
import urllib.request
import os

index=1
path="D:\images"

url="http://image.baidu.com/search/index?tn=baiduimage&ps=1&ct=201326592&lm=-1&cl=2&nc=1&ie=utf-8&word=fate"
page=urllib.request.urlopen(url)
html=page.read().decode("utf-8")


reg=r'"objURL":"(.*?)"'
imgre=re.compile(reg)
imglist=re.findall(imgre,html)

for x in imglist:
    filename = os.path.join(path, str(index) + ".jpg")
    urllib.request.urlretrieve(x,filename) 
    print("已爬取图片%d"%index)
    index+=1
