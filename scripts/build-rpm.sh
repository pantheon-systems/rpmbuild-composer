#!/bin/sh
#
#
set -ex
bin="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

# set a default build -> 0 for when it doesn't exist
CIRCLE_BUILD_NUM=${CIRCLE_BUILD_NUM:-0}

# epoch to use for -revision
epoch=$(date +%s)

shortname="composer"
name="$shortname"

version=$(cat $bin/../VERSION.txt)
iteration="$(date +%Y%m%d%H%M)"
arch='noarch'
url="https://github.com/composer/composer"
vendor='Pantheon'
description='composer: Pantheon rpm containing Composer dependency manager.'
install_prefix="/opt/composer/$shortname"

download_dir="$bin/../build"
target_dir="$bin/../pkgs"

rm -rf $download_dir
mkdir -p $download_dir
curl -L -f https://getcomposer.org/download/${version}/composer.phar --output $download_dir/composer.phar

mkdir -p "$target_dir"

fpm -s dir -t rpm  \
    --package "$target_dir/${name}-${version}-${iteration}.${arch}.rpm" \
    --name "${name}" \
    --version "${version}" \
    --iteration "${iteration}" \
    --epoch "${epoch}" \
    --architecture "${arch}" \
    --url "${url}" \
    --vendor "${vendor}" \
    --description "${description}" \
    --prefix "$install_prefix" \
    -C build \
    composer.phar
