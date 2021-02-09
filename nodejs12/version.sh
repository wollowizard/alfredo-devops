function getVersion() {
  VERSION=$(git describe --abbrev=0 --tags)
  echo "$VERSION"
}

function getNextVersion() {
  VERSION=$(getVersion)
  VERSION_BITS=(${VERSION//./ })
  MAJOR="${VERSION_BITS[0]}"
  MINOR="${VERSION_BITS[1]}"
  PATCH="${VERSION_BITS[2]}"
  PATCH="$((PATCH + 1))"
  NEW_TAG="$MAJOR.$MINOR.$PATCH"
  echo $NEW_TAG
}
