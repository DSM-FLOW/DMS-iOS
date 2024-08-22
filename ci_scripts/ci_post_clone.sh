#!/bin/sh

cd ../
rm -rf XCConfig
git clone https://github.com/team-aliens/DMS-XCConfig.git
mv DMS-XCConfig/XCConfig/ .
mv DMS-XCConfig/Firebase Projects/App/Support/

set -e

curl https://mise.run | sh
export PATH="$HOME/.local/bin:$PATH"
echo "Current PATH: $PATH"

echo "mise version"
mise --version

echo "mise install"
mise install # Installs the version from .mise.toml
eval "$(mise activate bash --shims)"

echo "tuist install"
tuist install

echo "tuist generate"
TUIST_CI=1
tuist generate
