# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

XORG_MODULE=data/
inherit xorg-3

DESCRIPTION="X.Org cursor themes: whiteglass, redglass and handhelds"
KEYWORDS="amd64 arm arm64 ~hppa ~mips ppc ppc64 ~riscv sparc x86"

BDEPEND="
	x11-apps/xcursorgen
"
RDEPEND="
	x11-libs/libX11
	x11-libs/libXcursor
"
