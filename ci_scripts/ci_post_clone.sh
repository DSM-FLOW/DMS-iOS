#!/bin/sh

cd ../
git clone https://github.com/team-aliens/DMS-XCConfig.git
mv DMS-XCConfig/XCConfig/ .

set -e
cd ..

curl https://mise.run | sh
export PATH="$HOME/.local/bin:$PATH"

# Output the current PATH for debugging
echo "Current PATH: $PATH"

echo "mise version"
mise --version
echo "mise install"
mise install # Installs the version from .mise.toml
eval "$(mise activate bash --shims)"

echo "mise doctor"
mise doctor
echo "tuist install"
tuist install
echo "tuist generate"
TUIST_CI=1
tuist generate
