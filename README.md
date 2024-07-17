# StarDock Fences Folder View 

This script saves folders, and all their subfolders, as detail view in a folder portal fence. If you run this script in the root folder of a folder portal, it will ensure the folder portal and any subfolders will display in the detail view.

Place this script into the root folder of your folder portal, and run it as admin. 
It will loop through every subfolder and add the corresponding registry keys to "HKCU:\Software\Stardock\Fences\ViewStates", which is where stardock Fences saves the viewstates for the folder portals.

This adds two keys, one for the root folder with a value of 3, the other for the ViewMode with a value of 4. 
This sets the folder to be in the details view, with the header hidden. You can adjust these values as you wish. 

![image](https://github.com/user-attachments/assets/4769d262-17f2-41d9-9119-ba0c9cee61f4)

![image](https://github.com/user-attachments/assets/ed2a579b-deed-4ae9-8f63-e81b41c273c8)
