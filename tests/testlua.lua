-- find the packages:
package.path = '../utf8.lua/?.lua;../?.lua;' .. package.path
zmd = require 'zmdocument'

print('% one author:')
print(zmd.formatAuthorsBase('Eskimon', '', false))

print('% three authors:')
print(zmd.formatAuthorsBase('Karnaj, Heziode, pierre_24', '', false))

print('% one author with link:')
print(zmd.formatAuthorsBase('Eskimon', 'http://test.com/author', false))

print('% one author with long name:')
print(zmd.formatAuthorsBase('that_author_with_a_very_long_name', '', false))

print('% one author with long name (but in author list, so full name):')
print(zmd.formatAuthorsBase('that_author_with_a_very_long_name', '', true))
