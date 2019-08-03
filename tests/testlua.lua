-- find the packages:
package.path = '../utf8.lua/?.lua;../?.lua;' .. package.path
zmd = require 'zmdocument'

-- run test on authors
print('% --- Test authors')
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

-- run test on abbrv
print('% --- Test abbrv')
print(zmd.cleanSpecialCharacters('AT\\&T'))
print(zmd.cleanSpecialCharacters('pierre\\_24'))
print(zmd.cleanSpecialCharacters('\\#hashtag'))
