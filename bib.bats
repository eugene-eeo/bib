#!/usr/bin/env bats

teardown() {
    rm "$(bib path _test)"
}

@test "bib add <x>" {
    bib add 123 _test
    bib add 456 _test
    bib add 789 _test
    result=$(cat "$(bib path _test)")
    [ "$result" = "123
456
789" ]
}

@test "bib add <x> does not re-add existing line" {
    bib add 123 _test
    bib add 123 _test
    [ "$(bib cat _test)" = "123" ]
}

@test "bib del <x> works for existing lines" {
    bib add 123 _test
    bib add 456 _test
    bib add 789 _test
    bib del 456 _test
    [ "$(bib cat _test)" = "123
789" ]
}

@test "bib del <x> works for non-existing lines" {
    bib add 123 _test
    bib add 456 _test
    bib del 789 _test
    [ "$(bib cat _test)" = "123
456" ]
}
