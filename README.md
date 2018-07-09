# vAdmin

#### A simple admin script for CS2D game. 

[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE)

It requires presense of the original ```wrapper.lua``` in ```sys/lua```.

To use, put ```/src``` content to ```sys/lua/autorun``` and run your server. Ranks can be edited by writing a proper USGN ID to corresponding list in ```memberlist.lua```. One-per-minute advertisement can be custumized too, as well as more messages can be added.

For now, it provides 5 ranks (owner, admin, smod, mod, vip). Owners menu provides Weapons option, which equips weapons with listed IDs, as well as Round Restart option. Owners and admins can use wallhack - just press F4 to teleport to cursor location.
