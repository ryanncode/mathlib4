/-
Copyright (c) 2026 Ryan Nolan. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Ryan Nolan
-/
module

public import Mathlib.LinearAlgebra.BilinearForm.IndefiniteMetric

/-!
# Symmetry Operators and Krein Spaces

This file defines the fundamental symmetry operator `J` for a Krein space.
A Krein space is an indefinite metric space equipped with a symmetry operator
that facilitates the decomposition into positive and negative definite subspaces.
-/

@[expose] public section

variable {R : Type*} [CommRing R]
variable {M : Type*} [AddCommGroup M] [Module R M]

/-- A symmetry operator J on an indefinite metric space. -/
structure SymmetryOperator (K : IndefiniteMetric R M) where
  /-- The operator J itself -/
  op : M →ₗ[R] M
  /-- J is an involution: J² = id -/
  involution : op.comp op = LinearMap.id
  /-- J is self-adjoint with respect to the indefinite metric -/
  self_adjoint : ∀ x y, K.bilin x (op y) = K.bilin (op x) y
