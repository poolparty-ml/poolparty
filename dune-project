(lang dune 3.12)

(name dbcaml)

(generate_opam_files true)

(source
 (github emilpriver/dbcaml))

(authors "Emil Priver <emil@priver.dev>")

(maintainers "Emil Priver <emil@priver.dev>")

(license MIT)

(documentation https://github.com/emilpriver/dbcaml)

(package
 (name poolparty)
 (synopsis "Poolparty")
 (description "Poolparty")
 (depends
  ocaml
  (alcotest :with-test)
  dune
  dbcaml
  serde)
 (tags
  (topics "pool" "ocaml")))
