# Can, Contains, Try, Coalesce, Lookup

## Quick comparism

| Function   | Input type     | Returns default on missing? | Checks for existence? | Handles errors? |
| ---------- | -------------- | --------------------------- | --------------------- | --------------- |
| `lookup`   | map            | ✅ yes                       | ⚠️ only map keys      | ❌ no            |
| `contains` | list           | ❌                           | ✅ yes (boolean)       | ❌ no            |
| `can`      | any expression | ❌                           | ✅ yes (boolean)       | ✅ yes           |
| `try`      | any expression | ✅ yes (via last argument)   | ✅ yes                 | ✅ yes           |
| `coalesce` | any value      | ✅ first non-null            | ❌ only null           | ❌ no            |
