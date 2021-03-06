# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )
inherit distutils-r1

DESCRIPTION="Empirical design and per-animal customization of stereotactic insertions."
HOMEPAGE="https://github.com/IBT-FMI/stereotaxyz"
SRC_URI=""

LICENSE="GPLv3"
SLOT="0"
KEYWORDS=""
IUSE=""

# Numpy dependency to circumvent scikits_learn dependency bug:
# https://bugs.gentoo.org/653052
DEPEND="
	>=dev-python/argh-0.26.2[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.13.3[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	sci-biology/ants
	sci-biology/mouse-brain-atlases
	sci-biology/nilearn[${PYTHON_USEDEP}]
	sci-libs/nibabel[${PYTHON_USEDEP}]
	sci-libs/nipype[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"


src_unpack() {
	cp -r -L "$DOTGENTOO_PACKAGE_ROOT" "$S"
}

python_test() {
	distutils_install_for_testing
	export MPLBACKEND="agg"
	export PATH=${TEST_DIR}/scripts:$PATH
	export PYTHONIOENCODING=utf-8
	for i in stereotaxyz/examples/*.py; do
		"${PYTHON}" "$i" || die "Example Python script $i failed with ${EPYTHON}"
	done
	./test_scripts.sh || die "Test scripts failed."
}
