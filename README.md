# faust-skeleton

This is a skeleton for creating FAUST based audio plugins.

It's intended to be used in scripts, in an automated way.<br/>
But it's also possible to be used manually.

Just follow these steps:
* Copy your faust dsp file into the plugin folder
* Run ./setup.sh and enter the desired plugin name
* Compile the plugin using 'make'

With this you get an LV2 plugin for your native system/platform.

This plugin skeleton does not provide support for custom UIs.<br/>
For LV2 plugins this is not an issue as you can create new UIs without modifying the original DSP object.
