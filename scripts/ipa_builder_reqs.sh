echo "Checking IPA Builder dependencies...."

# $1: ruby path with trailing sep

if ! [ -x "$(command -v $1sigh)" ]; then
  echo "installing sigh"

  $1gem install sigh

  if ! [ -x "$command -v $1sigh)" ]; then
    echo "Unable to install sigh gem." >&2
    exit 1
  fi
fi

echo "Dependency check passed."

exit 0
