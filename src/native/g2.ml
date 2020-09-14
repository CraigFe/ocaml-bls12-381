module G2_stubs = Rustc_bls12_381_bindings.G2 (Rustc_bls12_381_stubs)

module Uncompressed_Stubs = struct
  let size_in_bytes = 192

  let check_bytes bs =
    G2_stubs.uncompressed_check_bytes (Ctypes.ocaml_bytes_start bs)

  let is_zero bs = G2_stubs.is_zero (Ctypes.ocaml_bytes_start bs)

  let zero bs = G2_stubs.zero (Ctypes.ocaml_bytes_start bs)

  let one bs = G2_stubs.one (Ctypes.ocaml_bytes_start bs)

  let random bs = G2_stubs.random (Ctypes.ocaml_bytes_start bs)

  let add buffer x y =
    G2_stubs.add
      (Ctypes.ocaml_bytes_start buffer)
      (Ctypes.ocaml_bytes_start x)
      (Ctypes.ocaml_bytes_start y)

  let mul buffer x y =
    G2_stubs.mul
      (Ctypes.ocaml_bytes_start buffer)
      (Ctypes.ocaml_bytes_start x)
      (Ctypes.ocaml_bytes_start y)

  let eq x y =
    G2_stubs.eq (Ctypes.ocaml_bytes_start x) (Ctypes.ocaml_bytes_start y)

  let negate buffer x =
    G2_stubs.negate
      (Ctypes.ocaml_bytes_start buffer)
      (Ctypes.ocaml_bytes_start x)

  let double buffer x =
    G2_stubs.double
      (Ctypes.ocaml_bytes_start buffer)
      (Ctypes.ocaml_bytes_start x)

  let build_from_components buffer x_1 x_2 y_1 y_2 =
    G2_stubs.build_from_components
      (Ctypes.ocaml_bytes_start buffer)
      (Ctypes.ocaml_bytes_start x_1)
      (Ctypes.ocaml_bytes_start x_2)
      (Ctypes.ocaml_bytes_start y_1)
      (Ctypes.ocaml_bytes_start y_2)
end

module Compressed_Stubs = struct
  let size_in_bytes = 96

  let check_bytes bs =
    G2_stubs.compressed_check_bytes (Ctypes.ocaml_bytes_start bs)

  let is_zero bs = G2_stubs.compressed_is_zero (Ctypes.ocaml_bytes_start bs)

  let zero bs = G2_stubs.compressed_zero (Ctypes.ocaml_bytes_start bs)

  let one bs = G2_stubs.compressed_zero (Ctypes.ocaml_bytes_start bs)

  let random bs = G2_stubs.compressed_random (Ctypes.ocaml_bytes_start bs)

  let add buffer x y =
    G2_stubs.compressed_add
      (Ctypes.ocaml_bytes_start buffer)
      (Ctypes.ocaml_bytes_start x)
      (Ctypes.ocaml_bytes_start y)

  let mul buffer x y =
    G2_stubs.compressed_mul
      (Ctypes.ocaml_bytes_start buffer)
      (Ctypes.ocaml_bytes_start x)
      (Ctypes.ocaml_bytes_start y)

  let eq x y =
    G2_stubs.compressed_eq
      (Ctypes.ocaml_bytes_start x)
      (Ctypes.ocaml_bytes_start y)

  let negate buffer x =
    G2_stubs.compressed_negate
      (Ctypes.ocaml_bytes_start buffer)
      (Ctypes.ocaml_bytes_start x)

  let double buffer x =
    G2_stubs.compressed_double
      (Ctypes.ocaml_bytes_start buffer)
      (Ctypes.ocaml_bytes_start x)
end

module Uncompressed =
  Bls12_381_base.G2.MakeUncompressed (Fr) (Uncompressed_Stubs)
module Compressed = Bls12_381_base.G2.MakeCompressed (Fr) (Compressed_Stubs)

let compressed_of_uncompressed g =
  let buffer = Compressed.empty () in
  G2_stubs.compressed_of_uncompressed
    (Ctypes.ocaml_bytes_start (Compressed.to_bytes buffer))
    (Ctypes.ocaml_bytes_start (Uncompressed.to_bytes g)) ;
  Compressed.of_bytes_exn (Compressed.to_bytes buffer)

let uncompressed_of_compressed g =
  let buffer = Uncompressed.empty () in
  G2_stubs.uncompressed_of_compressed
    (Ctypes.ocaml_bytes_start (Uncompressed.to_bytes buffer))
    (Ctypes.ocaml_bytes_start (Compressed.to_bytes g)) ;
  Uncompressed.of_bytes_exn (Uncompressed.to_bytes buffer)