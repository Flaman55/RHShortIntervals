module

public import Mathlib

/-!
# Advertised statements

This file is the small, trusted surface a reader should audit. It imports only Mathlib.

Both statements assume Mathlib's `RiemannHypothesis` and are classical consequences of it: the
first is the theorem of section 7 of H. von Koch, Sur la distribution des nombres premiers, Acta
Math. 24 (1901); the second follows from it. Sharper forms with logarithms in place of `x^δ` and
`x^ε` (von Koch; H. Cramér) are not formalized here. The contribution is their proof in Lean from
`RiemannHypothesis`: a contour shift of the smoothed Chebyshev function of PrimeNumberTheoremAnd
to the line `Re s = 1/2 + δ`, with a bound `ζ'/ζ ≪ log |t|` there from Borel–Carathéodory and an
interpolated bound on the Mellin transform of the smoothing that keeps the exponent `1/2` (the
bound used in PrimeNumberTheoremAnd alone would give `3/4`).

1. `Submission.chebyshev_psi_error_of_RH`: under RH, for every `δ > 0`,
   `|ψ(x) - x| ≤ C x^(1/2 + δ)` for all large `x`, with `ψ` Mathlib's `Chebyshev.psi`.
2. `Submission.exists_prime_in_short_interval_of_RH`: under RH, for every `ε > 0` and all large
   `x` there is a prime `p` with `x < p ≤ x + x^(1/2 + ε)`.
-/

public section

theorem Submission.chebyshev_psi_error_of_RH (RH : RiemannHypothesis) (δ : ℝ) (hδ : 0 < δ) :
    ∃ C x₀ : ℝ, ∀ x : ℝ, x₀ ≤ x → |Chebyshev.psi x - x| ≤ C * x ^ (1 / 2 + δ) := by
  sorry

theorem Submission.exists_prime_in_short_interval_of_RH (RH : RiemannHypothesis) (ε : ℝ)
    (hε : 0 < ε) :
    ∃ x₀ : ℝ, ∀ x : ℝ, x₀ ≤ x →
      ∃ p : ℕ, p.Prime ∧ x < p ∧ (p : ℝ) ≤ x + x ^ (1 / 2 + ε) := by
  sorry

end
