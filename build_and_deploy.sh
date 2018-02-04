#!/bin/bash
set -e # stop on error

DEPLOY='master'
DEVEL='devel'

echo bulid client ...

mkdir -p build
cp index.html build/

echo reset $DEPLOY branch to $DEVEL ...
git fetch -f . $DEVEL:$DEPLOY
git checkout $DEPLOY
echo add build folder
git add -f build
echo commit changes
git commit -m "deploy to $DEPLOY"
echo push to remote $DEPLOY
git push origin `git subtree split --prefix build`:$DEPLOY --force
echo checkout branch $DEVEL
git checkout $DEVEL
echo All done!
