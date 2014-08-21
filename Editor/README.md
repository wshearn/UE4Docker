Unreal Engine 4 Docker Build Image
=========

This is a docker image for simplifying building the UnrealEngine 4 on Linux

It is based on Ubuntu 14.04 with all the deps needed to build included.

How to run:

Prep:

 - Install Docker ([ArchLinux], [Fedora], [Ubuntu])
 - mkdir -p $HOME/Projects/UnrealEngine/Deps
 - cd $HOME/Projects/UnrealEngine
 - git clone -b 4.4-linux git@github.com:3dluvr/UnrealEngine.git Source
 - Download the required deps from [here] and move them into $HOME/Projects/Deps
 - Also download [steamworks] and put in $HOME/Projects/Deps

To Build UnrealEngine:

 - docker pull wshearn/ue4editor
 - docker run -v $HOME/Projects/UnrealEngine/Source:/root/UnrealEngine -v $HOME/Projects/UnrealEngine/Deps:/root/Downloads wshearn/ue4editor

You can build the Editor in debug mode like so:

 - docker run -e "MAKE=UE4Editor-Linux-Debug" -v $HOME/Projects/UnrealEngine/Source:/root/UnrealEngine -v $HOME/Projects/UnrealEngine/Deps:/root/Downloads wshearn/ue4editor

Or if you want you can build slate viewer by changing out MAKE=UE4Editor-Linux-Debug with MAKE=SlateViewer

You should see the resulting binaries in $HOME/Projects/UnrealEngine/Source/Engine/Binaries/Linux/

[ArchLinux]: https://wiki.archlinux.org/index.php/Docker
[Fedora]: http://docs.docker.com/installation/fedora/
[Ubuntu]: http://docs.docker.com/installation/ubuntulinux/
[here]: https://github.com/3dluvr/UnrealEngine/releases/tag/4.4.0-release
[steamworks]: https://partner.steamgames.com/downloads/steamworks_sdk_130.zip
