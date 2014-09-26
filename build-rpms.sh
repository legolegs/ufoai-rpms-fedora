# This is not an actual script yet a reminder for myself

set -euo pipefail

rpmbuild -bs ufoai.spec
rpmbuild -bb ufoai-data.spec
mv ~/rpmbuild/RPMS/noarch/ufoai-*.noarch.rpm ./rpms/fc19/noarch/
mock -r fedora-19-i386   ~/rpmbuild/SRPMS/ufoai-2.5-1.fc19.R.src.rpm --resultdir=./rpms/"%(dist)s"/"%(target_arch)s"/
mock -r fedora-19-x86_64 ~/rpmbuild/SRPMS/ufoai-2.5-1.fc19.R.src.rpm --resultdir=./rpms/"%(dist)s"/"%(target_arch)s"/
