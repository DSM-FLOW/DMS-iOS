#!/bin/sh

cd ../
git clone https://github.com/team-aliens/DMS-XCConfig.git
mv DMS-XCConfig/XCConfig/ .

set -e
echo "dir"
pwd

cd ..
echo "dir"
pwd

curl https://mise.run | sh
export PATH="$HOME/.local/bin:$PATH"

mise install tuist
eval "$(mise activate bash --shims)"
echo "👉 Setting mise globally:"
mise use -g tuist

echo "tuist version"
tuist version

echo "current directory"
cd repository
pwd

echo "tuist install"
tuist install

echo "tuist generate"
TUIST_CI=1
tuist generate
