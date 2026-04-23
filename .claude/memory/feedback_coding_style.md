---
name: Scott's coding style preferences
description: Style and idiom preferences observed from Scott's cleanup edits — what to do and avoid when writing Go in this codebase
type: feedback
---

**Functional style, static single assignment, and deterministic control flow**
Prefer SSA-style code where variables are assigned once and control flow is predictable. Use immediately-invoked closures to produce a single result value rather than mutating variables across branches. Avoid patterns where the reader has to trace which branch last touched a variable.
**Why:** He refactored retry loops this way and applies the principle broadly.
**How to apply:** When writing loops or conditional logic, ask if the body can be expressed as a function/closure that returns a single value. Prefer that over accumulating state across branches.

**Religious about `defer` — design code around it**
Always use `defer` for cleanup, even if it means restructuring code to make that possible. The `success bool` pattern (set to true just before return, deferred cleanup checks it) is preferred for guarding against early-return resource leaks. For mutexes, always `defer r.Unlock()` — even if it means wrapping the critical section in a small lambda.
**Why:** He added the `success` guard pattern to `dial()` and applies defer consistently throughout.
**How to apply:** If you find yourself writing cleanup code in multiple return paths, stop and redesign with defer instead.

**`panic` on programming errors, not error returns**
If an error can only happen due to a bug (e.g. wrong struct type, violated invariant), panic rather than returning an error. Don't paper over bugs with error returns.
**Why:** He changed AppendStruct error handling to panic.
**How to apply:** Reserve error returns for runtime/environmental failures; panic for invariant violations.

**Inline operational knowledge in source**
Put setup SQL, example commands, or other operational knowledge directly in the source as named constants or comments — not just in external docs or Slack.
**Why:** He added `const consoleSQL` with the exact SQL needed to set up the CH user/DB.
**How to apply:** When there's setup/operational knowledge that's easy to lose, embed it in the source.

**Use `stderrors` for error handling, chaining, and inspection**
In most contexts, use the internal `fs/stderrors` package rather than rolling manual error checks. This includes context cancellation detection (`stderrors.HasCanceled`), error chaining, and inspection.
**Why:** Consistent with how the broader codebase handles errors.
**How to apply:** Check for stderrors utilities before writing manual error checks or using stdlib `errors` directly.
