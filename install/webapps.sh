#!/bin/bash

if [ -z "$OMARCHY_BARE" ]; then
  source ~/.local/share/omarchy/default/bash/functions
  web2app "Claude" https://claude.ai/new https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/claude-ai.png
  web2app "YouTube" https://youtube.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/youtube.png
  web2app "GitHub" https://github.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/github-light.png
  web2app "Omarchy Manual" https://manuals.omamix.org/2/the-omarchy-manual https://manuals.omamix.org/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6NDgsInB1ciI6ImJsb2JfaWQifX0=--c26606490139480f5bcb3cf91b09fc45825007f6/omarchy.jpg?disposition=attachment
fi
