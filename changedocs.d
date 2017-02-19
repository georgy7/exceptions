#!/usr/bin/env dub
/+ dub.sdl:
    name "changedocs"
    authors "Георгий Устинов"
    license "Unlicense"
    dependency "htmld" version="~>0.2.16"
+/

// This file released into the public domain.
// For more information, please refer to <http://unlicense.org/>

// The reason, why I've created this script, was
// that I could not understand, how to use custom layouts with ddox.
// https://github.com/rejectedsoftware/ddox/issues/88

import std.file;
import html;
import std.string;
import std.algorithm;
import std.stdio : writeln;

void modifyFile(string fileName) {
    auto doc = createDocument();
    doc.root.html = readText(fileName);
    Node*[] nodesToRemove = [];
    foreach(m; doc.querySelectorAll("section")) {
        auto sectionText = m.text.strip().toLower();
        if (["authors", "copyright", "license"].canFind(sectionText)) {
            writeln("From the file \"", fileName, "\" removing section \"", sectionText, "\"."); // Yoda style.
            nodesToRemove ~= m.node_;
        }
    }
    foreach (n; nodesToRemove) {
        n.detach();
    }
    write(fileName, doc.root.html);
}

void main() {
    writeln();
    auto files = dirEntries("docs", "*.html", SpanMode.breadth);
    foreach (fn; files) {
        modifyFile(fn);
    }
    writeln();
}
