# xncspot

**xncspot** is a wrapper around [ncspot](https://github.com/hrkfdn/ncspot). It uses [playerctl](https://github.com/altdesktop/playerctl) to find out which song is currently playing and sets it as the title of the terminal window in which ncspot is running.

It can also notify on track change, and log a history of played tracks to a logfile.

## Usage

Window classes are used to accurately target the ncspot window, so a terminal which supports custom window classes is required (e.g. kitty). The method by which ncspot is launched needs to change to accommodate this. For example:

```sh
kitty --class XNCSPOT_CLASS xncspot XNCSPOT_CLASS
```

## Configuration

If a YAML file exists at  `~/.config/xncspot/config.yml` it will be used to configure two additional features: notifications and logging. Notifications depend on `notify-send` and logging depends on... a filesystem?

```yaml
notifier:
  enabled: no
  timeout: 3000
  title: Spotify
  # title: ♪
  icon: ~/.local/share/icons/spotify.png
logger:
  enabled: yes
  file: ~/.local/share/xncspot/log.jsonl
```

## Dependencies

- [ncspot](https://github.com/hrkfdn/ncspot)
- [playerctl](https://github.com/altdesktop/playerctl)
- xdotool
- (optional) notify-send

## Contributions

Open an [issue](https://github.com/crdx/xncspot/issues) or send a [pull request](https://github.com/crdx/xncspot/pulls).

## Licence

[MIT](LICENCE.md).
