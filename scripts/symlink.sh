#!/usr/bin/env bash

repo=$(cd $(dirname $0); cd ..; pwd)
source_dir=${repo}/dots
destination_dir=$HOME

pushd $repo > /dev/null
git submodule init
git submodule update
popd > /dev/null

force_symlink() {
  target=$1
  from=${source_dir}/${target}
  to=${destination_dir}/${target}

  rm -rf $to
  ln -s $from $to
  echo "Link: ${target} -> ${to}"
}

for dots in `\ls -A ${source_dir}`; do
  force_symlink $dots
done

