#!/bin/bash
export WINEARCH=win32
export WINEPREFIX=$HOME/.wine32_ss13/
export WINEDEBUG=-all
wine ".wine/drive_c/Program Files (x86)/BYOND/bin/byond.exe"
