#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from collections import Counter, defaultdict
from pathlib import Path

DEFAULT_BACKLOG = Path('docs/research/derived/executable-backlog-from-feedback-2026-03.md')
ITEM_RE = re.compile(r'^###\s+(B\d+)\.\s+(.*)$')
FIELD_RE = re.compile(r'^-\s+\*\*(.+?)\*\*：\s*(.*)$')


def parse_backlog(path: Path):
    items = []
    current = None
    current_phase = None
    for raw_line in path.read_text(encoding='utf-8').splitlines():
        line = raw_line.rstrip('\n')
        if line.startswith('## ') and 'backlog' in line.lower():
            current_phase = line[3:].strip()
            continue
        m = ITEM_RE.match(line)
        if m:
            if current:
                items.append(current)
            current = {
                'id': m.group(1),
                'title': m.group(2).strip(),
                'section': current_phase or 'Unsectioned',
                'fields': {},
            }
            continue
        if current:
            fm = FIELD_RE.match(line)
            if fm:
                current['fields'][fm.group(1).strip()] = fm.group(2).strip()
    if current:
        items.append(current)
    return items


def render(items, source: Path):
    status_counter = Counter()
    venue_counter = Counter()
    by_section = defaultdict(list)

    for item in items:
        status = item['fields'].get('状态', 'unspecified').strip() or 'unspecified'
        venue = item['fields'].get('Execution Venue', 'unspecified').strip() or 'unspecified'
        status_counter[status] += 1
        venue_counter[venue] += 1
        by_section[item['section']].append(item)

    print(f'Backlog status summary: {source}')
    print(f'Total items: {len(items)}')
    print()

    print('Status counts:')
    for status in sorted(status_counter):
        print(f'- {status}: {status_counter[status]}')
    print()

    print('Execution venue counts:')
    for venue in sorted(venue_counter):
        print(f'- {venue}: {venue_counter[venue]}')
    print()

    done_items = [i for i in items if i['fields'].get('状态', '').strip() == 'done']
    if done_items:
        print('Completed items with landed commits:')
        for item in done_items:
            landed = item['fields'].get('Landed in', '(missing)')
            print(f"- {item['id']} {item['title']} [{item['section']}] -> {landed}")
        print()

    print('Items missing status or landed info:')
    missing_any = False
    for item in items:
        status = item['fields'].get('状态', '').strip()
        landed = item['fields'].get('Landed in', '').strip()
        if not status or (status == 'done' and not landed):
            missing_any = True
            pieces = []
            if not status:
                pieces.append('status')
            if status == 'done' and not landed:
                pieces.append('landed-in')
            print(f"- {item['id']} {item['title']} [{item['section']}] missing: {', '.join(pieces)}")
    if not missing_any:
        print('- none')
    print()

    print('Section summary:')
    for section, section_items in by_section.items():
        counts = Counter((i['fields'].get('状态', 'unspecified').strip() or 'unspecified') for i in section_items)
        parts = ', '.join(f'{k}={counts[k]}' for k in sorted(counts))
        print(f'- {section}: {len(section_items)} item(s) ({parts})')


def main(argv: list[str]) -> int:
    target = Path(argv[1]) if len(argv) > 1 else DEFAULT_BACKLOG
    if not target.exists():
        print(f'error: backlog file not found: {target}', file=sys.stderr)
        return 2
    items = parse_backlog(target)
    if not items:
        print(f'error: no backlog items found in {target}', file=sys.stderr)
        return 3
    render(items, target)
    return 0


if __name__ == '__main__':
    raise SystemExit(main(sys.argv))
