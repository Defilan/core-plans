pkg_name=freeradius-server
pkg_origin=defilan
pkg_version="3.0.16"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")
pkg_source="ftp://ftp.freeradius.org/pub/freeradius/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="2bd00dc92624064ce7a88ab77e21fe1b9edcd257765013f212f3283519e14d18"
pkg_deps=(core/openssl)
pkg_build_deps=(core/make core/gcc defilan/talloc core/openssl)

do_build() {
  ./configure --prefix="${pkg_prefix}" \
    --with-openssl-lib-dir="$(pkg_path_for core/openssl)/lib/libssl.so" \
    --with-openssl-include-dir="$(pkg_path_for core/openssl)/include" \
    --with-talloc-lib-dir="$(pkg_path_for defilan/talloc)" \
    --with-talloc-include-dir="$(pkg_path_for defilan/talloc)"
  make
}

do_check() {
  make check
}
