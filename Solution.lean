module

public import Applications.ShortInterval

/-!
# Proved solutions

The statements of `Challenge.lean`, proved in `Applications/` (steps 1-4) from Mathlib's
`RiemannHypothesis`.
-/

public section

theorem Submission.chebyshev_psi_error_of_RH (RH : RiemannHypothesis) (δ : ℝ) (hδ : 0 < δ) :
    ∃ C x₀ : ℝ, ∀ x : ℝ, x₀ ≤ x → |Chebyshev.psi x - x| ≤ C * x ^ (1 / 2 + δ) :=
  RHStructure.chebyshev_psi_of_RH RH hδ

theorem Submission.exists_prime_in_short_interval_of_RH (RH : RiemannHypothesis) (ε : ℝ)
    (hε : 0 < ε) :
    ∃ x₀ : ℝ, ∀ x : ℝ, x₀ ≤ x →
      ∃ p : ℕ, p.Prime ∧ x < p ∧ (p : ℝ) ≤ x + x ^ (1 / 2 + ε) :=
  RHStructure.exists_prime_short_interval_of_RH RH hε

end
