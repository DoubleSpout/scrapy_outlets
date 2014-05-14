#!/usr/bin/python 
# -*- coding: utf-8 -*-

from scrapy.cmdline import execute
import os

def mkdir(path):
    # 引入模块
    
    # 去除首位空格
    path=path.strip()
    # 去除尾部 \ 符号
    path=path.rstrip("\\")
 
    # 判断路径是否存在
    # 存在     True
    # 不存在   False
    isExists=os.path.exists(path)
 
    # 判断结果
    if not isExists:
        # 如果不存在则创建目录
        print path+' 创建成功'
        # 创建目录操作函数
        os.makedirs(path)
        return True
    else:
        # 如果目录存在则不创建，并提示目录已存在
        print path+' 目录已存在'
        return False


#计算路径，然后创建文件夹
curPath = os.path.split(os.path.realpath(__file__))[0]
targetPath = curPath + os.sep + 'outlets' + os.sep + 'spiders' + os.sep

pdfDir = targetPath + 'pdf'
imgDir = targetPath + 'img'
jsonDir = targetPath + 'json'

mkdir(pdfDir)
mkdir(imgDir)
mkdir(jsonDir)

execute()
