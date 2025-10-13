# Can, Contains, Try, Coalesce

## The difference between can() and try()
| Function                   | Purpose                                                                    | Returns                             | Typical Use                         |
| -------------------------- | -------------------------------------------------------------------------- | ----------------------------------- | ----------------------------------- |
| **`can(expr)`**            | Checks whether `expr` can be evaluated without error                       | `true` / `false`                    | Safe existence test (boolean check) |
| **`try(expr1, expr2, …)`** | Evaluates expressions in order, returns the first one that *doesn’t error* | Value of the first valid expression | Fallback / default value logic      |

## Quick summary: can() vs try()
| Situation                                                  | Use     | Example                             |
| ---------------------------------------------------------- | ------- | ----------------------------------- |
| You just want to **check if** an attribute exists          | `can()` | `can(var.obj.key)`                  |
| You want to **use the value or a fallback**                | `try()` | `try(var.obj.key, "default")`       |
| You want to **avoid crashes on nested lookups**            | `try()` | `try(var.obj.nested.value, "none")` |
| You need a **boolean flag** to use in `count` / `for_each` | `can()` | `count = can(var.obj.key) ? 1 : 0`  |


## Key Differences: Terraform Coalesce vs Try
Use coalesce for setting the default values and handling missing data.

Use try for error handling and fallback gracefully.