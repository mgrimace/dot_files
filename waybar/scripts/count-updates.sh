#!/bin/bash

# Count available DNF updates
updates=$(dnf check-update --quiet 2>/dev/null | grep -vE "^$|^Last metadata|Obsoleting Packages" | wc -l)
updates=${updates:-0}

if [ "$updates" -eq 0 ]; then
    # Print nothing so Waybar hides the module
    echo ""
else
    printf '{"text": "  %s", "alt": "%s", "tooltip": "%s updates"}' "$updates" "$updates" "$updates"
fi
