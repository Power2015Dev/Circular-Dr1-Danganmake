
# Minigame base template

This is a template you can use to inject your own DanganMake minigames.

Even though the template is designed with minigames in mind, you aren’t strictly limited to that your imagination allows you to create any events you’d like, whether for an intro or a trial.

If you encounter an issue where minigames fail to load, check whether it’s caused by duplicate UIDs. You can resolve this by deleting the `.uid` file and removing the UID path found within the `.tscn` file, located next to `type="Script"`.

To prevent such errors, always clone the repository when creating a new minigame, rather than copying an existing one you’ve already built.

## WARNING

Under no circumstances should you use operating system functions or HTTP requests.

Be aware of malware; if you suspect that a .pck file from a creator contains malware, DO NOT INSTALL IT, and report it on the official Discord.

We recommend that you upload your minigame as open-source code on GitHub to avoid such issues.

## Please be mindful of what you do. 




## Authors

- [@power2015](https://github.com/Power2015Dev)
- [@FreddysDark-on](https://github.com/FreddysDark-on)



## Documentation

Below, you'll find the documentation for more information on the functions and what you can use.

[Danganmake Documentation](https://power2015dev.github.io/Danganmake-Engine/content.html)


## Installation

Download Godot 4.7 from its official website.
[Godot](https://godotengine.org/es/)

Open Godot and import the project using the `project.godot` file.

This is a template you can work on once opened, but it is important not to change the current filters in the resources if the filters aren't applied, you need to go to the resources menu when exporting the project and enter this in the filters:

```bash
res://Dummy_Autoloads/*, res://Minigame_Music/*, res://Minigame_SFX/*, res://Minigame_Voices/*, 
res://default_bus_layout.tres, res://export_presets.cfg, res://icon.svg, res://iconDanganmake.png,
res://README.md, res://Danganmakeicon.ico
```

And when exporting, you need to make sure to export a `zip` or `pck` file.


    