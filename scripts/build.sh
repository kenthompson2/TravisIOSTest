ARCHIVE_PATH=$HOME/build/TravisTest
ARCHIVE_FILE=$ARCHIVE_PATH.xcarchive
EXPORT_FILE=$HOME/build/TravisTest.ipa

xcodebuild archive -project TravisTest.xcodeproj -scheme TravisTest -sdk iphoneos -archivePath $ARCHIVE_PATH

echo $ARCHIVE_FILE

##### paths
xcodebuild -exportArchive -archivePath $ARCHIVE_FILE -exportPath $EXPORT_FILE -exportFormat ipa -exportProvisioningProfile travis_test