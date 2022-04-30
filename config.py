#!/usr/bin/env python3
from json import load
from typing import Optional
from re import compile as regexp, Match
from sys import argv

REGEX_LOOKUP = regexp(r'\$\{([^}]*)\}')
REGEX_LOOKUPCMD = regexp(r'\|(\w+)\(([^)]*)\)')

with open('./settings.json', 'r') as fh:
    config = load(fh)

def get_value(key: str, default: Optional[str] = None) -> Optional[str]:
    value = config
    if key.startswith('#'):
        return ''
    for part in key.split('.'):
        if match := REGEX_LOOKUPCMD.match(part):
            command, args = match.groups()
            if command in ('j', 'join'):
                value = str.join(' ', [
                    process_value(value[k]) for k in args.split(',')
                ])
        elif isinstance(value, list):
            index = int(part)
            if index >= len(value):
                return default
            value = value[index]
        elif part not in value:
            return default
        elif isinstance(value, dict):
            value = value[part]
        else:
            print(value, part)
            raise ValueError('oopsie')
    return value

def replace_value(match: Match) -> str:
    lookup, *pipeline = match.groups()[0].split(':')
    if lookup.startswith('#'):
        return ''
    value = get_value(lookup) or ''
    for sub in pipeline:
        if sub[0] == 's':
            a, b = sub[2:].split(sub[1])
            value = value.replace(a, b)
        elif sub[0] == 'u':
            value = value.upper()
    return process_value(value)

def process_value(value: str) -> str:
    return REGEX_LOOKUP.sub(replace_value, value)

def lookup(key: str) -> str:
    return process_value(get_value(key) or '')

