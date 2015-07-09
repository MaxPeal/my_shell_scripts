# -*- coding: utf-8 -*-

import xlwt
import feedparser

feed = "http://www.bbc.co.uk/portuguese/index.xml"
channel = feedparser.parse(feed)

w = xlwt.Workbook()
sheet = w.add_sheet(u'News')
sheet.write(0, 0, u'Manchete')
sheet.write(0, 1, u'Endereço')

for i in xrange(len(channel.entries)):
        sheet.write(i+1, 0, channel.entries[i].title)
        sheet.write(i+1, 1, channel.entries[i].link)

w.save('z.xls')
