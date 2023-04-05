EAPI=8

inherit desktop

DESCRIPTION="Open source note-taking app"
HOMEPAGE="https://joplinapp.org/"
SRC_URI="https://github.com/laurent22/joplin/releases/download/v${PV}/Joplin-${PV}.AppImage
	https://joplinapp.org/images/Icon512.png -> ${PN}.png"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="binchecks strip"

S="${WORKDIR}"

src_install() {
  doicon -s 512 ${DISTDIR}/${PN}.png
  cp ${DISTDIR}/Joplin-${PV}.AppImage ${PN} || die
  dobin ${PN}
  make_desktop_entry "${PN}" "Joplin" "${PN}" "Office;" \
    "StartupWMClass=Joplin\nMimeType=x-scheme-handler/joplin;\nSingleMainWindow=true"
}

