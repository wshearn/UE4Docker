#!/bin/bash

UEPATH=/root/UnrealEngine

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

DEPFILE=$UEPATH/Engine/Build/BatchFiles/Linux/dependencies

if [ ! -f ${DEPFILE}.installed ] || [ "$(diff $DEPFILE.txt $DEPFILE.installed >/dev/null 2>&1)" != "0" ] ; then
    PrepWork
fi

UE4Editor