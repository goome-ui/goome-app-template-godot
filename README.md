<p align="center">
  <img src="https://raw.githubusercontent.com/goome-ui/.github/main/profile/logo.png" alt="goome" width="150">
</p>

<h1 align="center">🤖 goome app template: Godot 🤖</h1>

<p align="center">
<b>A tiny Godot project with goome in it. A full screen app panel, and one toggle turns it into a window floating over the game.</b>
</p>

<p align="center">
  <img src="https://goome-ui.github.io/docs/assets/badges/godot-44.svg" alt="Godot 4.4+">
  <img src="https://goome-ui.github.io/docs/assets/badges/template-use-me.svg" alt="template">
  <img src="https://img.shields.io/badge/license-GPL--3.0-1b1d22?style=flat-square" alt="GPL-3.0">
</p>

<p align="center">
  Hit <b>Use this template</b> up top and you get your own copy that builds right away, CI included. Or let <a href="https://github.com/goome-ui/goome-cli">goome-cli</a> make it with your own name already in it.<br>
  Its <a href="https://github.com/goome-ui/godot-goome">godot-goome</a> underneath, the docs for the whole ui kit are at <a href="https://goome-ui.github.io/docs/">goome-ui.github.io/docs</a>.<br> <br>
  Do you like this project? If so, please let me know!
  <a href="https://sevvy-wevvy.com/discord">Discord</a>
</p>

<p align="center">
  <a href="https://goome-ui.github.io/docs/">Docs</a> &nbsp;·&nbsp;
  <a href="https://github.com/goome-ui/goome-cli">goome-cli</a> &nbsp;·&nbsp;
  <a href="https://github.com/goome-ui/godot-goome">godot-goome</a> &nbsp;·&nbsp;
  <a href="https://github.com/goome-ui/examples">Examples</a>
</p>

<p align="center">
  The <a href="https://goome-ui.github.io/docs/downloads/">ready made apps</a> on the <a href="https://github.com/goome-ui/examples/releases/latest">examples release</a> show what you can build from here.<br>
  If you get stuck, ask in <a href="https://github.com/goome-ui/c-goome/discussions">Discussions</a>. The <a href="https://github.com/goome-ui/godot-goome/labels/good%20first%20issue">good first issues</a> on godot-goome are small ones if you want to help.
</p>

<details>
<summary align="center"><b>🚀 Make Your Own 🚀</b></summary>

<br>

<p align="center">
<b>Use this template</b> on GitHub gives you this repo as it is. With goome-cli you pick the name and which template you want:
</p>

```sh
pip install git+https://github.com/goome-ui/goome-cli
goome new my-thing --lang godot
goome new my-thing --lang godot --template hud
```

<p align="center">
It swaps "My Goome App" and friends for your name everywhere, files too, and leaves out the template only stuff.
</p>
</details>

<details>
<summary align="center"><b>🔨 Build And Run 🔨</b></summary>

<br>

<p align="center">
The goome addon isnt in the repo, grab it first. It downloads the zip from the <a href="https://github.com/goome-ui/godot-goome/releases">godot-goome releases</a> into <code>addons/goome/</code>, with the libs for linux, windows and mac.
</p>

```sh
./get-goome.sh                    # or get-goome.ps1 in powershell
godot -e --path .
```

<p align="center">
Then hit play. Put a version after the script (<code>./get-goome.sh 0.3.0</code>) for another one.<br> <br>
The game is <code>game.gd</code>, a spinning square so you can see the ui sit on top of something. The ui is <code>ui.gd</code> on the <code>GoomeView</code> in <code>main.tscn</code>.
</p>
</details>

<details>
<summary align="center"><b>🧩 Other Templates 🧩</b></summary>

<br>

<p align="center">
<code>variants/</code> has the other starting points. Each one is the file that replaces <code>ui.gd</code>:<br> <br>
<b>overlay</b> - a goome window floating over the game, clicks next to it go to the game<br>
<b>mod-menu</b> - a menu with toggles and sliders, alt+m opens and closes it<br>
<b>hud</b> - a little panel in the corner with the time and fps<br><br>
<code>goome new</code> puts the one you pick in place for you. By hand, copy the file over <code>ui.gd</code> and delete <code>variants/</code>.
</p>
</details>

<details>
<summary align="center"><b>🧪 Testing Without A Screen 🧪</b></summary>

<br>

<p align="center">
<code>tests/check.tscn</code> runs the game headless, clicks the toggle and checks it flipped. CI runs it on linux, windows and mac:
</p>

```sh
godot --headless --path . res://tests/check.tscn
```
</details>

<details>
<summary align="center"><b>🛠 Pull Requests 🛠</b></summary>

<br>

<p align="center">
Want to help with this template? Make A pull request to <b>dev</b>!<br>
Keep it small, its supposed to be the least code you need to get going. Bugs in goome itself go to <a href="https://github.com/goome-ui/godot-goome">godot-goome</a>.<br> <br>
As long as it works, and doesnt vary off too far from the main idea its very likely it get accepted!<br>
Read <a href="CONTRIBUTING.md">CONTRIBUTING.md</a> before you send one.
</p>
</details>

<details>
<summary align="center"><b>⚖️ License ⚖️</b></summary>

<br>

<p align="center">
This template is under the <a href="LICENSE">GPL-3.0</a>, same as goome.<br> <br>
<sub>
• You can use it, change it and share it<br>
• If you share something made with it, you have to share your source too, under the same license<br>
• Keep the credits
</sub><br> <br>
In short: play fair, keep it open, and give credit where it's due.
</p>
</details>

<details>
<summary align="center"><b>🩷 Donate 🩷</b></summary>

<br>

<p align="center">
<a href="https://sevvy-wevvy.com/kofi">Ko-fi</a> (Preferred)<br>
<a href="https://sevvy-wevvy.com/patreon">Patreon</a><br>
<a href="https://sevvy-wevvy.com/throne">Throne</a>
</p>
</details>

<p align="center">
<b>🫶 Contributors 🫶</b><br>
Thanks to everyone who helped out!<br> <br>
<a href="https://github.com/goome-ui/goome-app-template-godot/graphs/contributors"><img src="https://contrib.rocks/image?repo=goome-ui/goome-app-template-godot" alt="contributors"></a>
</p>
