# RHShortIntervals

A Lean 4 / Mathlib proof that Mathlib's `RiemannHypothesis` implies

- `Submission.chebyshev_psi_error_of_RH`: for every `δ > 0` there are `C`, `x₀` with
  `|ψ(x) - x| ≤ C x^(1/2 + δ)` for `x ≥ x₀` (Mathlib's `Chebyshev.psi`);
- `Submission.exists_prime_in_short_interval_of_RH`: for every `ε > 0` there is `x₀` such that
  for every real `x ≥ x₀` there is a prime `p` with `x < p ≤ x + x^(1/2 + ε)`.

Both are classical consequences of RH (H. von Koch, Acta Math. 24 (1901), §7; sharper forms with
logarithms by von Koch and by H. Cramér are not formalized here). The contribution is their proof
in Lean. `Challenge.lean` imports only Mathlib; `Solution.lean` proves both statements. They
depend only on `propext`, `Classical.choice`, `Quot.sound`.

## Proof (`Applications/`)

The smoothed Chebyshev function of PrimeNumberTheoremAnd is moved to the line
`Re s = 1/2 + δ` (`SmoothedChebyshevPull1`).

1. `RHLogDeriv.lean`: under RH, `ζ'/ζ(σ + it) ≪ log |t|` for `σ ≥ 1/2 + δ` (a holomorphic
   logarithm of `ζ` on a disk and the Borel–Carathéodory bound for its derivative).
2. `RHMellin.lean`: `|𝓜(s)| ≤ K ε^(-η) |s|^(-(1+η))` for the Mellin transform of the smoothing,
   interpolating `A/|s|` and `B/(ε|s|²)`; the second bound alone would give exponent `3/4`.
3. `RHPsi.lean`: the contour estimate, `ψ(x) = x + O(x^(1/2+δ))`.
4. `ShortInterval.lean`: with `ψ - θ = O(√x)`, `θ(x + x^(1/2+ε)) > θ(x)` for large `x`.

`StructuralWindow.lean` (not advertised) states the consequences in the language of the author's
Structural Window (<https://github.com/Flaman55/Structural-Window>): under RH, for every
`θ > 1/2`, every large window `(A, A + ⌈A^θ⌉]` has a void, the next prime after a large prime `p`
is within `⌈p^θ⌉`, and every window of the march `A_(k+1) = A_k + ⌈A_k^θ⌉` contains a prime.

`PNTPort/` holds files of PrimeNumberTheoremAnd
(<https://github.com/AlexKontorovich/PrimeNumberTheoremAnd>, commit `e990613`, Apache-2.0)
ported to Mathlib `56a0058` with mechanical changes, listed in `PORTING.md`.

## Companion repository

<https://github.com/Flaman55/RHStructure> holds the accompanying note
(`paper/why_one_half.tex`), a structural reading of the Lean proof of RH by Levent Alpöge (with
Claude) in the rewriting grh-compact by Luke Sernau and colleagues at Anthropic (with Claude), and
applies the theorems of this repository to grh-compact's `RiemannHypothesis`. Neither RH nor its
proof is a result of this work.

## Build

Lean v4.35.0 (`lean-toolchain`), Mathlib `56a0058`. `lake exe cache get` then `lake build`.

## License and attribution

Apache-2.0 (`LICENSE`). See `NOTICE` for PrimeNumberTheoremAnd. The Lean files and texts were
written with Claude (Anthropic) under the author's direction; the author ran every build.
