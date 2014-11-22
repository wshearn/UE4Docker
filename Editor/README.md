Unreal Engine 4 Docker Build Image
=========

This is a docker image for simplifying building the UnrealEngine 4 on Linux

It is based on CentOS 7 with all the deps needed to build included. Please note
I am using a custom [copr repo] which has clang 4.5 and mono 3.10 in it. These
packages clobber what is in EPEL.

How to run:

Prep:

 - Install Docker ([ArchLinux], [Fedora], [Ubuntu])
 - mkdir -p $HOME/Projects/UnrealEngine/Deps
 - cd $HOME/Projects/UnrealEngine
 - git clone git@github.com:EpicGames/UnrealEngine.git Source
 - Generate a [GitHub Auth Token] with just repo access

To Build UnrealEngine:

 - docker pull wshearn/ue4editor
 - docker run -v $HOME/Projects/UnrealEngine/Source:/root/UnrealEngine -v $HOME/Projects/UnrealEngine/Deps:/root/Downloads -e OAUTH_TOKEN="<generated github token here>" -ti wshearn/ue4editor
 - NOTE for each build of a different version you will have to pass -ti to it, this is so you can confirm the "destructive" changes.

You can build the Editor in debug mode like so:

 - docker run -e "MAKE=UE4Editor-Linux-Debug" -v $HOME/Projects/UnrealEngine/Source:/root/UnrealEngine -v $HOME/Projects/UnrealEngine/Deps:/root/Downloads -e OAUTH_TOKEN="<generated github token here>" -ti wshearn/ue4editor

Or if you want you can build slate viewer by changing out MAKE=UE4Editor-Linux-Debug with MAKE=SlateViewer

You should see the resulting binaries in $HOME/Projects/UnrealEngine/Source/Engine/Binaries/Linux/

[copr repo]: https://copr.fedoraproject.org/coprs/jknife/ue4deps/
[ArchLinux]: https://wiki.archlinux.org/index.php/Docker
[Fedora]: http://docs.docker.com/installation/fedora/
[Ubuntu]: http://docs.docker.com/installation/ubuntulinux/
[GitHub Auth Token]: https://github.com/settings/tokens/new
