# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} pypy3_11 )

inherit distutils-r1 pypi

DESCRIPTION="Pure-Python Implementation of the AES block-cipher and common modes of operation"
HOMEPAGE="https://pypi.org/project/pyaes/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~m68k ~mips ppc ppc64 ~s390 sparc x86 ~x64-macos"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	test? (
		dev-python/pycryptodome[${PYTHON_USEDEP}]
	)
"

python_test() {
	local t fail=
	for t in tests/test-*.py; do
		einfo "${t}"
		"${EPYTHON}" "${t}" || fail=1
	done
	[[ ${fail} ]] && die "Tests fail with ${EPYTHON}"
}
