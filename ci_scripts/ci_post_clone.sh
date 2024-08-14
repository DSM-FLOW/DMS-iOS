#!/bin/sh

cd ../
git clone https://github.com/team-aliens/DMS-XCConfig.git
mv DMS-XCConfig/XCConfig/ .

set -e
cd ..

curl https://mise.jdx.dev/install.sh | sh

export PATH="$HOME/.local/bin:$PATH"
echo "Current PATH: $PATH"

echo "mise version"
mise --version
echo "mise install"
mise install
eval "$(mise activate bash --shims)"

echo "mise doctor"
mise doctor

echo "tuist install"
mise x tuist install
echo "tuist generate"
TUIST_CI=1
mise x tuist generate
