#!/usr/bin/env python3
from re import Match, compile as regexp
from sys import argv
from config import lookup, process_value, config
REGEX_FILE_LOOKUP = regexp(r'\@\@([^@]+)(\@(.*))?\@\@')

def lookup_match(match: Match) -> str:
    key, _, parameter = match.groups()
    if key.startswith('templates.'):
        _, template = key.split('.', 1)
        template = config['templates'][template]
        return process_value(template.replace('@', parameter))
    else:
        return lookup(key)

def main():
    with open(argv[1], 'r') as fh:
        for line in fh:
            print(REGEX_FILE_LOOKUP.sub(lookup_match, line.rstrip('\n')))

if __name__ == '__main__':
    main()

