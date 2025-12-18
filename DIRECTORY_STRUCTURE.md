# Project Directory Structure

This document provides an overview of the project's directory structure.

---

## Directory Tree

```
📦 T3-Odie-Rebirth-of-the-KPI/
├── 📁 audit--rebirth-of-the-kpi/
│   ├── 📁 addons/
│   │   └── 📁 dialogue_manager/
│   │       ├── 📁 assets/
│   │       ├── 📁 compiler/
│   │       ├── 📁 components/
│   │       ├── 📁 example_balloon/
│   │       ├── 📁 l10n/
│   │       ├── 📁 utilities/
│   │       ├── 📁 views/
│   │       ├── 📜 constants.gd
│   │       ├── 📄 constants.gd.uid
│   │       ├── 📜 dialogue_label.gd
│   │       ├── 📄 dialogue_label.gd.uid
│   │       ├── 🎬 dialogue_label.tscn
│   │       ├── 📜 dialogue_line.gd
│   │       ├── 📄 dialogue_line.gd.uid
│   │       ├── 📜 dialogue_manager.gd
│   │       ├── 📄 dialogue_manager.gd.uid
│   │       ├── 📜 dialogue_resource.gd
│   │       ├── 📄 dialogue_resource.gd.uid
│   │       ├── 📜 dialogue_response.gd
│   │       ├── 📄 dialogue_response.gd.uid
│   │       ├── 📜 dialogue_responses_menu.gd
│   │       ├── 📄 dialogue_responses_menu.gd.uid
│   │       ├── 📄 DialogueManager.cs
│   │       ├── 📄 DialogueManager.cs.uid
│   │       ├── 📜 editor_translation_parser_plugin.gd
│   │       ├── 📄 editor_translation_parser_plugin.gd.uid
│   │       ├── 📜 export_plugin.gd
│   │       ├── 📄 export_plugin.gd.uid
│   │       ├── 📜 import_plugin.gd
│   │       ├── 📄 import_plugin.gd.uid
│   │       ├── 📜 inspector_plugin.gd
│   │       ├── 📄 inspector_plugin.gd.uid
│   │       ├── 📄 LICENSE
│   │       ├── 🔧 plugin.cfg
│   │       ├── 📄 plugin.cfg.uid
│   │       ├── 📜 plugin.gd
│   │       ├── 📄 plugin.gd.uid
│   │       ├── 📜 settings.gd
│   │       ├── 📄 settings.gd.uid
│   │       ├── 📜 test_scene.gd
│   │       ├── 📄 test_scene.gd.uid
│   │       └── 🎬 test_scene.tscn
│   ├── 📁 assets/
│   │   ├── 📁 map/
│   │   │   ├── 📁 offices/
│   │   │   ├── 🖼️ audit_house.png
│   │   │   ├── 🖼️ BD001.png
│   │   │   ├── 📄 BD001.png.import
│   │   │   ├── 🖼️ Commercial.png
│   │   │   ├── 📄 Commercial.png.import
│   │   │   ├── 🖼️ Communication.png
│   │   │   ├── 📄 Communication.png.import
│   │   │   ├── 🖼️ Finance.png
│   │   │   ├── 📄 Finance.png.import
│   │   │   ├── 🖼️ Home.png
│   │   │   ├── 📄 Home.png.import
│   │   │   ├── 🖼️ It.png
│   │   │   ├── 📄 It.png.import
│   │   │   ├── 🖼️ RH.png
│   │   │   ├── 📄 RH.png.import
│   │   │   ├── 🖼️ Sample.png
│   │   │   ├── 📄 Sample.png.import
│   │   │   ├── 🖼️ tilemap.png
│   │   │   └── 📄 tilemap.png.import
│   │   ├── 📁 sound/
│   │   │   ├── 🔊 button_switch.mp3
│   │   │   └── 📄 button_switch.mp3.import
│   │   ├── 📁 sprites/
│   │   │   ├── 📁 objects/
│   │   │   ├── 📁 player_animations/
│   │   │   ├── 📁 pnj_animations/
│   │   │   ├── 🖼️ arrowsheet.png
│   │   │   ├── 📄 arrowsheet.png.import
│   │   │   ├── 🖼️ fight_menu_background.png
│   │   │   ├── 📄 fight_menu_background.png.import
│   │   │   └── 🖼️ tuto_speech.png
│   │   ├── ⚙️ button.tres
│   │   ├── 📄 button_font.ttf
│   │   ├── 🖼️ button_sprite.png
│   │   ├── 🖼️ dialogue_theme.png
│   │   └── 🖼️ start_menu.png
│   ├── 📁 dialogue/
│   │   ├── 📁 texte/
│   │   │   ├── 📄 Commercial.dialogue
│   │   │   ├── 📄 Communication.dialogue
│   │   │   ├── 📄 Finance.dialogue
│   │   │   ├── 📄 Home.dialogue
│   │   │   ├── 📄 Info.dialogue
│   │   │   └── 📄 Rh.dialogue
│   │   ├── 📜 dialogue.gd
│   │   ├── 📄 dialogue.gd.uid
│   │   ├── 🎬 dialogue.tscn
│   │   └── ⚙️ dialogue_theme.tres
│   ├── 📁 scenes/
│   │   ├── 📁 exploration/
│   │   │   ├── 📁 board/
│   │   │   ├── 📁 player/
│   │   │   └── 📁 pnj/
│   │   ├── 📁 fight/
│   │   │   ├── 📁 scripts/
│   │   │   ├── 📜 fight.gd
│   │   │   ├── 📄 fight.gd.uid
│   │   │   ├── 🎬 fight.tscn
│   │   │   ├── 📜 log.gd
│   │   │   ├── 📄 log.gd.uid
│   │   │   ├── 📜 message_panel.gd
│   │   │   └── 📄 message_panel.gd.uid
│   │   ├── 📁 menu/
│   │   │   ├── 📁 sound/
│   │   │   ├── 📜 exit.gd
│   │   │   ├── 📄 exit.gd.uid
│   │   │   ├── 🎬 menu.tscn
│   │   │   ├── 📜 setting.gd
│   │   │   ├── 📄 setting.gd.uid
│   │   │   ├── 📜 start.gd
│   │   │   ├── 📄 start.gd.uid
│   │   │   ├── 📜 text.gd
│   │   │   ├── 📄 text.gd.uid
│   │   │   └── 🎬 textemodele.tscn
│   │   └── 📁 rapport_final/
│   │       ├── 🖼️ fond.png
│   │       ├── 📜 quitter.gd
│   │       ├── 📄 quitter.gd.uid
│   │       ├── 📜 rapport_audit.gd
│   │       ├── 📄 rapport_audit.gd.uid
│   │       ├── 🎬 rapport_audit.tscn
│   │       ├── 📜 rejouer.gd
│   │       └── 📄 rejouer.gd.uid
│   ├── 📁 Uml/
│   │   └── 📄 audit-rebirth-of-the-kpi.puml
│   ├── 📄 .editorconfig
│   ├── 📄 .gitattributes
│   ├── 📄 .gitignore
│   ├── ⚙️ default_bus_layout.tres
│   ├── 🎨 icon.svg
│   ├── 📄 icon.svg.import
│   ├── 📜 panel.gd
│   ├── 📄 panel.gd.uid
│   └── 📄 project.godot
├── 📁 docs/
│   ├── 📄 dialogue_dialogue.md
│   ├── 📄 index.md
│   ├── 📄 panel.md
│   ├── 📄 scenes_exploration_board_commercialBuilding.md
│   ├── 📄 scenes_exploration_board_communicationBuilding.md
│   ├── 📄 scenes_exploration_board_financesBuilding.md
│   ├── 📄 scenes_exploration_board_HomeBuilding.md
│   ├── 📄 scenes_exploration_board_itBuilding.md
│   ├── 📄 scenes_exploration_board_offices_comm_office.md
│   ├── 📄 scenes_exploration_board_offices_commercial_office.md
│   ├── 📄 scenes_exploration_board_offices_finances_office.md
│   ├── 📄 scenes_exploration_board_offices_it_office.md
│   ├── 📄 scenes_exploration_board_offices_office_zone.md
│   ├── 📄 scenes_exploration_board_offices_rh_office.md
│   ├── 📄 scenes_exploration_board_pause_pause_menu.md
│   ├── 📄 scenes_exploration_board_pause_sound_bar.md
│   ├── 📄 scenes_exploration_board_player_lvl.md
│   ├── 📄 scenes_exploration_board_rhBuilding.md
│   ├── 📄 scenes_exploration_board_todo.md
│   ├── 📄 scenes_exploration_board_Tuto.md
│   ├── 📄 scenes_exploration_player_GameState.md
│   ├── 📄 scenes_exploration_player_player.md
│   ├── 📄 scenes_exploration_pnj_commercial.md
│   ├── 📄 scenes_exploration_pnj_communication.md
│   ├── 📄 scenes_exploration_pnj_finances.md
│   ├── 📄 scenes_exploration_pnj_it.md
│   ├── 📄 scenes_exploration_pnj_pnj.md
│   ├── 📄 scenes_fight_fight.md
│   ├── 📄 scenes_fight_log.md
│   ├── 📄 scenes_fight_message_panel.md
│   ├── 📄 scenes_fight_scripts_Attack.md
│   ├── 📄 scenes_fight_scripts_audio_stream_player.md
│   ├── 📄 scenes_fight_scripts_creation_fighter.md
│   ├── 📄 scenes_fight_scripts_creation_player.md
│   ├── 📄 scenes_fight_scripts_cursor.md
│   ├── 📄 scenes_fight_scripts_ennemies_scripts_Fighter.md
│   ├── 📄 scenes_menu_exit.md
│   ├── 📄 scenes_menu_setting.md
│   ├── 📄 scenes_menu_start.md
│   ├── 📄 scenes_menu_text.md
│   ├── 📄 scenes_rapport_final_quitter.md
│   ├── 📄 scenes_rapport_final_rapport_audit.md
│   └── 📄 scenes_rapport_final_rejouer.md
├── 📁 website/
│   ├── 📄 dialogue_dialogue.html
│   ├── 📄 index.html
│   ├── 📄 panel.html
│   ├── 📄 scenes_exploration_board_commercialBuilding.html
│   ├── 📄 scenes_exploration_board_communicationBuilding.html
│   ├── 📄 scenes_exploration_board_financesBuilding.html
│   ├── 📄 scenes_exploration_board_HomeBuilding.html
│   ├── 📄 scenes_exploration_board_itBuilding.html
│   ├── 📄 scenes_exploration_board_offices_comm_office.html
│   ├── 📄 scenes_exploration_board_offices_commercial_office.html
│   ├── 📄 scenes_exploration_board_offices_finances_office.html
│   ├── 📄 scenes_exploration_board_offices_it_office.html
│   ├── 📄 scenes_exploration_board_offices_office_zone.html
│   ├── 📄 scenes_exploration_board_offices_rh_office.html
│   ├── 📄 scenes_exploration_board_pause_pause_menu.html
│   ├── 📄 scenes_exploration_board_pause_sound_bar.html
│   ├── 📄 scenes_exploration_board_player_lvl.html
│   ├── 📄 scenes_exploration_board_rhBuilding.html
│   ├── 📄 scenes_exploration_board_todo.html
│   ├── 📄 scenes_exploration_board_Tuto.html
│   ├── 📄 scenes_exploration_player_GameState.html
│   ├── 📄 scenes_exploration_player_player.html
│   ├── 📄 scenes_exploration_pnj_commercial.html
│   ├── 📄 scenes_exploration_pnj_communication.html
│   ├── 📄 scenes_exploration_pnj_finances.html
│   ├── 📄 scenes_exploration_pnj_it.html
│   ├── 📄 scenes_exploration_pnj_pnj.html
│   ├── 📄 scenes_fight_fight.html
│   ├── 📄 scenes_fight_log.html
│   ├── 📄 scenes_fight_message_panel.html
│   ├── 📄 scenes_fight_scripts_Attack.html
│   ├── 📄 scenes_fight_scripts_audio_stream_player.html
│   ├── 📄 scenes_fight_scripts_creation_fighter.html
│   ├── 📄 scenes_fight_scripts_creation_player.html
│   ├── 📄 scenes_fight_scripts_cursor.html
│   ├── 📄 scenes_fight_scripts_ennemies_scripts_Fighter.html
│   ├── 📄 scenes_menu_exit.html
│   ├── 📄 scenes_menu_setting.html
│   ├── 📄 scenes_menu_start.html
│   ├── 📄 scenes_menu_text.html
│   ├── 📄 scenes_rapport_final_quitter.html
│   ├── 📄 scenes_rapport_final_rapport_audit.html
│   └── 📄 scenes_rapport_final_rejouer.html
├── 📄 .gitignore
├── 📄 Cahier des charges.md
├── 📄 DIRECTORY_STRUCTURE.md
├── 🐍 generate_all.py
├── 🐍 generate_directory.py
├── 🐍 generate_docs.py
├── 🐍 generate_website.py
├── 📄 LICENSE
├── 📄 README.md
└── 📄 WIKI.md
```

## File Statistics

| File Type | Count |
|-----------|-------|
| .uid | 86 |
| .png | 86 |
| .gd | 82 |
| .import | 63 |
| .md | 47 |
| .html | 43 |
| .tscn | 32 |
| no extension | 6 |
| .dialogue | 6 |
| .mp3 | 6 |
| .po | 5 |
| .py | 4 |
| .tres | 4 |
| .svg | 4 |
| .cs | 2 |
| .godot | 1 |
| .cfg | 1 |
| .mo | 1 |
| .pot | 1 |
| .puml | 1 |
| .ttf | 1 |
| .m4a | 1 |
| .txt | 1 |

## Key Directories

### `audit--rebirth-of-the-kpi/`
Main Godot project directory

### `audit--rebirth-of-the-kpi/scenes/`
Game scenes (exploration, fight, menu, etc.)

### `audit--rebirth-of-the-kpi/scenes/exploration/`
Exploration gameplay scenes and scripts

### `audit--rebirth-of-the-kpi/scenes/fight/`
Combat system scenes and scripts

### `audit--rebirth-of-the-kpi/scenes/menu/`
Main menu interface

### `audit--rebirth-of-the-kpi/dialogue/`
Dialogue system and text

### `audit--rebirth-of-the-kpi/assets/`
Game assets (sprites, audio, etc.)

### `audit--rebirth-of-the-kpi/addons/`
Third-party Godot addons

### `docs/`
Generated markdown documentation

### `website/`
Generated HTML documentation website

## Important Files

### `README.md`
Project overview and instructions

### `WIKI.md`
Pedagogical documentation

### `Cahier des charges.md`
Project specifications

### `LICENSE`
Project license (Apache 2.0)

### `audit--rebirth-of-the-kpi/project.godot`
Godot project configuration

### `generate_docs.py`
Script to generate documentation from GDScript files

### `generate_website.py`
Script to generate HTML website from documentation
