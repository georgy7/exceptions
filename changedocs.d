#!/usr/bin/env dub
/+ dub.sdl:
    name "changedocs"
    authors "Георгий Устинов"
    license "CC0"
    dependency "htmld" version="~>0.2.16"
+/

// Changedocs - The simple documentation transformation script.
// Written in 2017 by Georgy Ustinov <httpcatharsis@gmail.com>
// To the extent possible under law, the author have dedicated all copyright
// and related and neighboring rights to this software to the public domain worldwide.
// This software is distributed without any warranty.
// For the full text of the CC0 Public Domain Dedication, see <http://creativecommons.org/publicdomain/zero/1.0/>.

// The reason, why I've created this script, was
// that I could not understand, how to use custom layouts with ddox.
// https://github.com/rejectedsoftware/ddox/issues/88

import std.file;
import html;
import std.string;
import std.algorithm;
import std.stdio : writeln;

auto ribbon = "<a href=\"https://github.com/georgy7/exceptions\"><img style=\"position: absolute; top: 0; right: 0; border: 0;\" src=\"https://camo.githubusercontent.com/365986a132ccd6a44c23a9169022c0b5c890c387/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f7265645f6161303030302e706e67\" alt=\"Fork me on GitHub\" data-canonical-src=\"https://s3.amazonaws.com/github/ribbons/forkme_right_red_aa0000.png\"></a>";

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

    auto ribbonElement = doc.createElement("a"); // TODO fix this (<a> inside <a>).
    ribbonElement.html = ribbon;
    doc.querySelector("body").appendChild(ribbonElement);

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
