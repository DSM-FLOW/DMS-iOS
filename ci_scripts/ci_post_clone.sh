#!/bin/sh

pwd

cd ../
git clone https://github.com/team-aliens/DMS-XCConfig.git
mv DMS-XCConfig/XCConfig/ .

cd XCConfig
ls
cd ..

pwd
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
