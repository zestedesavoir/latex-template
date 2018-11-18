#!/bin/bash
expected=$(cat ./testlua.lua.expected)
actual=$(texlua ./testlua.lua)
if [[ "$expected" != "$actual" ]]; then 
    echo $expected
    echo $actual
    echo '!! The output of `texlua testlua.lua` changed: zmdocument.lua was modified.'
    echo '!! Did you forget to do `texlua ./testlua.lua > testlua.lua.expected` ?'
    exit 1
else
    echo 'zmdocument.lua was not modified.'
fi
