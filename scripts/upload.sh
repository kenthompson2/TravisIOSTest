#!/bin/sh
if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
  echo "This is a pull request. No deployment will be done."
  exit 0
fi

ARCHIVE_FILE="$HOME/build/TravisTest.ipa"
APP_ID="76d53a0857974c6a98ae883d97ccbd63"

curl https://rink.hockeyapp.net/api/2/apps/$APP_ID/app_versions/upload \
-F status="2" \
-F notify="0" \
-F ipa="@$ARCHIVE_FILE" \
-H "X-HockeyAppToken: $HOCKEY_APP_TOKEN"
