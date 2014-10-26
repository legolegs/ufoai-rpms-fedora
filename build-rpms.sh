# This is not an actual script yet a reminder for myself
exit 1
set -euo pipefail

rpmbuild -bs ufoai.spec
rpmbuild -bb ufoai-data.spec
mv ~/rpmbuild/RPMS/noarch/ufoai-*.noarch.rpm ./rpms/fc19/noarch/
mock -r fedora-19-i386   ~/rpmbuild/SRPMS/ufoai-2.5-1.fc19.R.src.rpm --resultdir=./rpms/"%(dist)s"/"%(target_arch)s"/
mock -r fedora-19-x86_64 ~/rpmbuild/SRPMS/ufoai-2.5-1.fc19.R.src.rpm --resultdir=./rpms/"%(dist)s"/"%(target_arch)s"/

createrepo --update --retain-old-md 1 --deltas --max-delta-rpm-size 1000000000 --database /mnt/big/var/ftp/ufoai_rpms/fc19/
