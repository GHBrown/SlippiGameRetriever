# Slippi Game Retriever
Creates a hotkey which automatically copies the latest .slp file from the autosave folder to a folder of your choosing and another hotkey which automatically deletes all .slp files in the autosave folder.

The executable provided essentially opens your existing Dolphin.exe while providing the extra hotkey functionality.

## Installation
1. Download SlippiGameRetriever.exe and the three accompanying text files and place them anywhere (so long as they are in the same folder).
2. Locate folder to which .slp files are automatically saved, copy its full path, open autosaveFolder.txt and paste this path into the file, ensure the file is only one line long and contains no extra characters.
3. Copy the full path of the folder to which you would like selected replays to be sent, open culledFolder.txt and paste this path into the file, ensure the file is only one line long and contains no extra characters.
4. Copy the full path of Slippi (including Dolphin.exe), open SlippiPath.txt and paste this path into the file, ensure the file is only one line long and contains no extra characters.
5. Use SlippiGameRetriever.exe or a shortcut to SlippiGameRetriever.exe as you would use Dolphin.exe or a shortcut to Dolphin.exe. 

## Hotkeys
&#8595: copies the latest .slp file in the autosave folder
&#8592 + &#8594: deletes all .slp files in the autosave folder
