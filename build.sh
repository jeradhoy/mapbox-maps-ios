#!/bin/bash

make deps
rm -rf artifact
mkdir artifact
cp scripts/release/README.md artifact
make xcframework
cp -r build/Build/Products/XCFramework/MapboxMaps.xcframework artifact
scripts/framework/make-xcframework.sh MapboxCommon Carthage/Build/iOS artifact
scripts/framework/make-xcframework.sh MapboxCoreMaps Carthage/Build/iOS artifact
scripts/framework/make-xcframework.sh MapboxMobileEvents Carthage/Build/iOS artifact
scripts/framework/make-xcframework.sh Turf Carthage/Build/iOS artifact
zip -r MapboxMaps.zip artifact