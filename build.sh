#!/bin/bash

UEPATH=/root/UnrealEngine
DEPFILE=$UEPATH/Engine/Build/BatchFiles/Linux/dependencies

cd $UEPATH

PrepWork() {
    pushd Engine/Build/BatchFiles/Linux/

    set +x
    FORCEEXTRACT=1 bash ./UpdateDeps.sh
    bash ./BuildThirdParty.sh
    bash ./GenerateProjectFiles.sh
    set -x

    popd
}

UE4Editor() {
    make ShaderCompileWorker
    make UnrealLightmass
    make UnrealPak
    make UE4Editor
}

UE4Server() {
    make UE4Server
}

UE4Game() {
    make UE4Game
}

Build() {
    if [ "$BUILD" == "Server" ]; then
        UE4Server
    elif [ "$BUILD" == "Editor" ]; then
        UE4Editor
    elif [ "$BUILD" == "Game" ]; then
        UE4Game
    else
        echo "=========== BUILD is not set, defaulting to Editor ==========="
        echo "This is normally set in the Dockerfile"
        UE4Editor
    fi
}

if [ ! -f ${DEPFILE}.installed ] || [ "$(diff $DEPFILE.txt $DEPFILE.installed >/dev/null 2>&1)" != "0" ] ; then
    PrepWork
fi

if [ "x$MAKE" == "x" ] ; then
    Build
else
    make ${MAKE}
fi

# Get the UID:GID from GenerateProjectFiles.sh and reset all the permissions to match
# Otherwise we get a segfault due to the editor not being able to access Saved or Intermediate
chown -R $(ls -l GenerateProjectFiles.sh  | awk '{ print $3":"$4 }') *
