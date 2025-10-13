# Functions that support ...

| Function             | Description                                                              |
| -------------------- | ------------------------------------------------------------------------ |
| **`concat()`**       | Joins multiple lists or tuples together.                                 |
| **`coalesce()`**     | Returns the first non-null value from any number of arguments.           |
| **`coalescelist()`** | Returns the first non-empty list from any number of list arguments.      |
| **`merge()`**        | Merges multiple maps together.                                           |
| **`min()`**          | Returns the smallest of any number of numbers.                           |
| **`max()`**          | Returns the largest of any number of numbers.                            |
| **`join()`**         | (⚠️ Not variadic — takes exactly two arguments, so `...` not supported.) |
| **`format()`**       | (⚠️ Only takes one format string + values list — no `...` expansion.)    |



## 🚫 Functions that do not support it
| Function                                      | Reason                                 |
| --------------------------------------------- | -------------------------------------- |
| `zipmap()`                                    | Always requires exactly two arguments. |
| `length()`                                    | Takes exactly one argument.            |
| `flatten()`                                   | Takes exactly one argument.            |
| `format()`, `join()`, `element()`, `lookup()` | Have fixed signatures.                 |
