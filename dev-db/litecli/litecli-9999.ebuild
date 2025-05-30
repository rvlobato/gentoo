# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )
PYTHON_REQ_USE="sqlite"
inherit distutils-r1

DESCRIPTION="CLI for SQLite with auto-completion and syntax highlighting"
HOMEPAGE="https://litecli.com/ https://github.com/dbcli/litecli"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dbcli/litecli.git"
else
	inherit pypi
	KEYWORDS="amd64 x86"
fi

LICENSE="BSD"
SLOT="0"

RDEPEND="
	>=dev-python/click-4.1[${PYTHON_USEDEP}]
	>=dev-python/cli-helpers-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/configobj-5.0.5[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.3[${PYTHON_USEDEP}]
	<dev-python/prompt-toolkit-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-1.5[${PYTHON_USEDEP}]
	>=dev-python/sqlparse-0.4.4[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
