#!/bin/bash
expected=$(cat ./testlua.lua.expected)
actual=$(texlua ./testlua.lua)
if [[ "$expected" != "$actual" ]]; then 
    echo '!! The output of `texlua testlua.lua` changed: zmdocument.lua was modified:'
    diff  <(echo "$actual" ) <(echo "$expected")
    echo '!! Did you forget to do `texlua ./testlua.lua > testlua.lua.expected` ?'
    exit 1
else
    echo 'zmdocument.lua was not modified.'
fi
