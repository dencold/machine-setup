package main

import (
	"fmt"
	"os"
	"path/filepath"
)

var encoder map[string]string = map[string]string{
	"a": "u",
	"b": "q",
	"c": "z",
	"d": "n",
	"e": "o",
	"f": "b",
	"g": "s",
	"h": "x",
	"i": "a",
	"j": "d",
	"k": "y",
	"l": "p",
	"m": "r",
	"n": "h",
	"o": "e",
	"p": "w",
	"q": "v",
	"r": "c",
	"s": "t",
	"t": "l",
	"u": "i",
	"v": "f",
	"w": "g",
	"x": "j",
	"y": "m",
	"z": "k",
}

var decoder map[string]string = map[string]string{
	"u": "a",
	"q": "b",
	"z": "c",
	"n": "d",
	"o": "e",
	"b": "f",
	"s": "g",
	"x": "h",
	"a": "i",
	"d": "j",
	"y": "k",
	"p": "l",
	"r": "m",
	"h": "n",
	"e": "o",
	"w": "p",
	"v": "q",
	"c": "r",
	"t": "s",
	"l": "t",
	"i": "u",
	"f": "v",
	"g": "w",
	"j": "x",
	"m": "y",
	"k": "z",
}

func main() {
	args := os.Args

	if len(args) < 2 {
		fail()
	}

	if args[1] != "e" && args[1] != "d" {
		fail()
	}

	if args[1] == "e" {
		filepath.Walk(".", walkEncode)
	} else {
		filepath.Walk(".", walkDecode)
	}
}

func fail() {
	fmt.Println("Usage: tis e|d")
	os.Exit(1)
}

func isHidden(filepath string) bool {
	if len(filepath) > 1 && string(filepath[0]) == "." {
		return true
	}

	return false
}

func walkDecode(path string, info os.FileInfo, err error) error {
	if isHidden(path) {
		return filepath.SkipDir
	}

	if info.IsDir() {
		fmt.Printf("%s => %s\n", path, codec(path, decoder))
	}
	return nil
}

func walkEncode(path string, info os.FileInfo, err error) error {
	if isHidden(path) {
		return filepath.SkipDir
	}

	if info.IsDir() {
		fmt.Printf("%s => %s\n", path, codec(path, encoder))
	}
	return nil
}

func codec(in string, mapper map[string]string) string {

	ret := ""

	for _, letter := range in {
		l := string(letter)
		r, ok := mapper[l]

		if ok {
			ret += r
		} else {
			ret += l
		}
	}

	return ret
}
