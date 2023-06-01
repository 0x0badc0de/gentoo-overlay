EAPI=8

inherit desktop

DESCRIPTION="A second brain, for you, forever"
HOMEPAGE="https://obsidian.md/"
SRC_URI="https://github.com/obsidianmd/obsidian-releases/releases/download/v${PV}/Obsidian-${PV}.AppImage
	https://appimage.github.io/database/Obsidian/icons/128x128/obsidian.png -> ${PN}.png"

LICENSE="Obsidian-EULA"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="binchecks strip"

S="${WORKDIR}"

src_install() {
  doicon -s 128 ${DISTDIR}/${PN}.png
  cp ${DISTDIR}/Obsidian-${PV}.AppImage ${PN} || die
  dobin ${PN}
  make_desktop_entry "${PN}" "Obsidian" "${PN}" "Office;" \
    "StartupWMClass=Obsidian\nMimeType=x-scheme-handler/obsidian;\nSingleMainWindow=true"
}

