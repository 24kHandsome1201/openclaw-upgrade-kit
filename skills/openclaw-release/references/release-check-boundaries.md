# Release Check Boundaries

A release check should clearly separate:
- what exists now in the repository
- what was validated locally
- what is still only planned
- what still requires a final tag or publish step

Good release work should answer:
- which files and scripts were actually checked?
- which release helpers were actually run?
- what claims are supported by docs/examples/results?
- what remains a release risk?

Avoid:
- treating roadmap items as shipped features
- assuming a release is ready because the docs sound complete
- skipping script validation for packaging or archive flows
