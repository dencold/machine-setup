package main

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

type cipher map[string]string

var encoder cipher = map[string]string{
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

var decoder cipher = map[string]string{
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

var debug bool

func main() {
	args := os.Args

	if len(args) < 2 {
		fail()
	}

	if args[1] != "e" && args[1] != "d" {
		fail()
	}

	debug = checkFlag(args, "--debug")

	if args[1] == "e" {
		err := filepath.Walk(".", walkEncode)

		if err != nil {
			fmt.Println("encode err: ", err.Error())
		}
	} else {
		err := filepath.Walk(".", walkDecode)

		if err != nil {
			fmt.Println("decode err: ", err.Error())
		}
	}
}

func fail() {
	fmt.Println("Usage: tis e|d")
	os.Exit(1)
}

func isHidden(filename string) bool {
	if len(filename) > 1 && string(filename[0]) == "." {
		return true
	}

	return false
}

func walkDecode(path string, info os.FileInfo, err error) error {
	if err != nil {
		fmt.Printf("Error on path: %s, %s\n", path, err.Error())
		return err
	}

	return printPath(path, info, decoder)
}

func walkEncode(path string, info os.FileInfo, err error) error {
	if err != nil {
		fmt.Printf("Error on path: %s, %s\n", path, err.Error())
		return err
	}

	return printPath(path, info, encoder)
}

func printPath(path string, info os.FileInfo, c cipher) error {
	// check if this is a hidden file/directory, if so we want to skip it
	if isHidden(info.Name()) {
		if debug {
			fmt.Printf("Skipping hidden path: %s\n", path)
		}
		if info.IsDir() {
			return filepath.SkipDir
		}

		return nil
	} else {
		// translate the encoded/decoded representation of this file/dir
		// but, do not translate the file's extension (does not apply to dirs)
		translatedPath := ""
		if info.IsDir() {
			translatedPath = translate(path, c)
		} else {
			p, ext := splitExtension(path)

			translatedPath = translate(p, c)
			translatedPath += ext
		}
		fmt.Printf("%s => %s\n", path, translatedPath)
	}

	return nil
}

func splitExtension(path string) (string, string) {
	ext := filepath.Ext(path)
	if ext == "" {
		return path, ""
	}

	return strings.TrimSuffix(path, ext), ext
}

func translate(in string, mapper cipher) string {
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

func checkFlag(args []string, matchTerm string) bool {
	for _, arg := range args {
		if arg == matchTerm {
			return true
		}
	}

	return false
}
