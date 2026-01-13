#!/usr/bin/env bash

# fix paths
# page.html -> page/index.html

for f in dist/*.html; do
	name="$(basename "${f%.html}")"
	if [ "$name" = "index" ]; then
		continue
	fi
	new="dist/$name/index.html"
	mkdir -p "$(dirname "$new")"
	mv -f "$f" "$new"
done
