#!/bin/bash

chromium $1
i3-msg '[class="skin"] move scratchpad'
i3-msg '[class="Chromium"] move scratchpad'
i3-msg '[class="Chromium"] scratchpad show'
