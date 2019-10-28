import sys

from rfc2html import markup

infile = sys.argv[1]
outfile = sys.argv[2]

with open(infile) as inf, open(outfile, "w+") as outf:
    outf.write(markup(inf.read()))

