# Splat Expression

This folder demonstrates how to use splat expressions in Terraform to efficiently extract and manipulate values from lists and maps. The examples show:

- How to use the splat syntax (`[*].attribute`) to collect attributes from all elements in a list.
- The difference between splat expressions and `for` expressions for iterating over collections.
- How to flatten nested lists and normalize data using functions like `flatten()` and `lower()`.
- Grouping and deduplicating items based on keys, and merging attributes from multiple objects.
- The limitations of splat expressions (they only work on lists, not maps) and how to work with maps using `for` expressions and the `values()` function.

These patterns are useful for transforming and aggregating data structures in Terraform configurations.