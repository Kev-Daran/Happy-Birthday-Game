# Happy Birthday Game 

A cute 2D adventure game made with Godot 4 as a personalized birthday gift! Players explore a mysterious village, solve simple puzzles, and uncover a heartwarming message.

## Features

- Top-down 2D exploration gameplay
- Interactive dialogue system with branching conversations
- Simple puzzle mechanics (finding items, unlocking areas)
- Customizable story and characters

  ## Prerequisites

- [Godot 4.x](https://godotengine.org/download) (Free and open source)
- Basic familiarity with Godot Editor (optional but helpful for customization)

  ## How to Run

1. **Download Godot 4**: Get the latest version from [godotengine.org](https://godotengine.org/download)

2. **Clone/Download this repository**:
   ```bash
   git clone https://github.com/Kev-Daran/Happy-Birthday-Game.git
   ```

3. **Open in Godot**:
   - Launch Godot 4
   - Click "Import"
   - Navigate to the `happy-birthday` folder
   - Select the `project.godot` file
   - Click "Import & Edit"

4. **Run the Game**:
   - Press F5 or click the play button
   - Select the main scene if prompted
  
  ## How to Personalize for Your Partner

### 1. Change Character Names

**File to edit**: `happy-birthday/dialogue/main.dialogue`

Replace the default names:
- `BruVyta` → Your name or nickname
- `Grizzle` → Your partner's name or nickname

**Find and replace throughout the file**:
```
BruVyta: → YourName:
Grizzle: → PartnerName:
```

### 2. Customize the Final Message

**Key dialogue sections to personalize**:

**Final message** (search for `"OVER"`):
```
BruVyta: Happy birthday
```
Change to your personal birthday message.

(search for `"TARGET_OPENED"`):
Customize this with your own heartfelt message.

### 3. Personalize the Story

**Village backstory**: Modify the mystery explanation to include personal references, inside jokes, or shared memories.

**Item descriptions**: Update what the characters say when interacting with tools (sickle, pickaxe, rake, etc.)

**House diary entries**: Customize the diary messages to include personal touches


## Game Structure

```
happy-birthday/
├── Scenes/
│   ├── Characters/player.tscn    # Player character
│   └── Levels/
│       ├── map.tscn             # Main game scene
│       └── village.gd           # Game state logic
├── dialogue/main.dialogue       # All game dialogue
├── helpers/
│   ├── actionable.gd           # Interaction system
│   └── actionable.tscn         # Interaction component
└── Assets/                     # Game images and resources
```


## Gameplay Flow

1. **Intro**: Characters wake up in mysterious village
2. **Exploration**: Find tools scattered around the area
3. **Key Discovery**: Find the key hidden under the rake
4. **House Investigation**: Read diary entries to learn the story
5. **Tree Search**: Find the autumn tree with the final clue
6. **Town Square**: Reach the conclusion
7. **Happy Ending**: Sweet birthday message revealed

## State System

The game uses a global `State.status` variable to track progress:
- `"INTRO"` → `"SPIEL_OVER"` → `"KEY_FOUND"` → `"TARGET_OPENED"` → `"HOUSE_FOUND"` → `"TREE_FOUND"` → `"OVER"`

**To create an executable**:
1. Go to Project → Export
2. Add your target platform (Windows, Mac, Linux, Android, etc.)
3. Configure export settings
4. Export the project

**To share**:
- Send the exported executable to your partner
- Or share the Godot project if they want to see "behind the scenes"

## License

This project is open source.

## Screenshots
<img width="849" height="754" alt="image" src="https://github.com/user-attachments/assets/8ffa86a7-f258-4311-975d-aa474608e954" />

<img width="1898" height="993" alt="image" src="https://github.com/user-attachments/assets/0f4156b0-62dd-4e1b-8017-889a738859e5" />

<img width="1452" height="644" alt="image" src="https://github.com/user-attachments/assets/5ebb8850-1cdc-4a9b-8ddc-3c502063afe4" />


*Original game created as a personal birthday gift*

Map tiles is Tiny Town by Kenney : [https://kenney.nl/assets](https://kenney.nl/assets/tiny-town)
