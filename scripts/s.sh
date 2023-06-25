#!/bin/bash

{ sed -n "1,$(($1 - 1)) p" chapter-1.md; sed -n "$1,$2 p" ../en/chapter-1.md; sed -n "$(($2 + 1)),\$p" chapter-1.md; } > tmp.md && mv tmp.md chapter-1.md
