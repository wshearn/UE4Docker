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

SlateViewer() {
    make SlateViewer
}

UE4Editor() {
    make ShaderCompileWorker
    make UnrealLightmass
    make UnrealPak
    make UE4Editor
}

PrepWork
SlateViewer
UE4Editor