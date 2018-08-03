pkg_name=libunbound
pkg_origin=core
pkg_version="1.7.3"
pkg_upstream_url=https://nlnetlabs.nl/svc/unbound
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_description="Unbound is a validating, recursive, and caching DNS resolver."
pkg_license=("BSD-3-Clause")
pkg_source="https://github.com/NLnetLabs/unbound.git"
pkg_source="https://www.nlnetlabs.nl/downloads/unbound/unbound-${pkg_version}.tar.gz"
pkg_shasum="c11de115d928a6b48b2165e0214402a7a7da313cd479203a7ce7a8b62cba602d"
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_pconfig_dirs=(lib/pkgconfig)
pkg_dirname="unbound-${pkg_version}"

pkg_deps=(core/glibc)

pkg_build_deps=(
core/gcc
core/make
core/coreutils
core/pkg-config
core/autoconf
core/automake
core/openssl
)

do_build() {
  ./configure --prefix="${pkg_prefix}" \
	  --with-ssl="$(pkg_path_for openssl)" \
	  --with-ssl-include="$(pkg_path_for openssl)/include" 
}

do_check(){
  make check
}
