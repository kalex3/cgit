#!/bin/sh
case "$(printf '%s' "$1" | tr '[:upper:]' '[:lower:]')" in
	*.markdown|*.mdown|*.md|*.mkd) exec md2html --github; ;;
	*.[1-9]) exec exec mandoc -T html; ;;
	*.htm|*.html) exec cat; ;;
	*.txt|*) exec sed "s|&|\\&amp;|g;s|'|\\&apos;|g;s|\"|\\&quot;|g;s|<|\\&lt;|g;s|>|\\&gt;|g" | sed "1s|^|<pre>|;\$s|$|<\/pre>|"; ;;
esac
