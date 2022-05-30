# Archive-Manager-Script

College assignment: Create a bash script that let a user pack multiple files to archive / unpack archive to a specific directory. Use dialog program for GUI

## Description

The script lets u choose between 3 options: pack, unpack, exit.
Pack: you can choose multiple files and name your archive. The archive will be created in script main directory.
Unpack: you can choose betweeen two options: choose existing directory or create a new one. The archive will be unpacked to it.
Available extensions: ```zip,rar,tar,gz,bz2```.

The script is translated to Polish.

## Guide
**[Tested on Fedora 36]**

Download the ZIP with all the scripts and unpack them in directory of your choice. Use terminal inside the directory and input ``./pack_unpack_bash.sh``

### MAIN MENU
Use **arrows** or **numbers** to switch between options in main menu. Switch between Ok/Anuluj using **TAB**. Select Option using **SPACE** 

![284065326_424823316154298_1150076782306770425_n](https://user-images.githubusercontent.com/61662701/171053804-c77fe420-084c-4b4e-a10f-bb2e189d8d8c.png)

### PACK

Use **TAB** to switch focus between directories, files and DODAJ/UTWORZ options in files selection window. Select a directory/file using **SPACE**. Select DODAJ/UTWORZ using **ENTER**. Next choose extension and input the archive name.

![2](https://user-images.githubusercontent.com/61662701/171054055-abf10bde-d593-4b08-88c9-19b299a5b496.png)


### UNPACK 

Choose between Nowy folder/Istniejacy folder option. Input a directory name or choose an existing directory and then choose archive to unpack. Controls are the same as in main menu and pack.

![3](https://user-images.githubusercontent.com/61662701/171054533-73f29931-f482-4d1e-b78e-2e7d91ff0990.png)

![4](https://user-images.githubusercontent.com/61662701/171054539-88bacdef-c4d9-44ff-8753-e6baee4c5592.png)
