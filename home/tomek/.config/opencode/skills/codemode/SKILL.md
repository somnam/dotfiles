---
name: Code Mode
description: Use when the same read repeats over several items, or a small answer is needed from many tool results, so one `execute` program beats a turn per item.
---

## Find the path first

A guessed path fails as `UnknownTool`. `search` returns paths with full signatures; it is thenable, so it works with or without `await`.

```js
return search("issues")
```

```js
return search({ namespace: "opencode" })
```

```js
return search()
```

`tools` holds namespaces, not the file tools: here `tools.opencode`, `tools.browser` when the desktop app is attached, and MCP servers that are connected. `read`, `grep`, and `shell` stay direct calls. `fetch` is a global for HTTP. Names with dashes use brackets: `tools["server-name"]["some-tool"]`.
Read the signature before writing property access; a tool returning an envelope needs unwrapping.

## Project at the source

Return the fields the answer needs, not the payload.

```js
const ids = ["notebook", "pencil", "mug", "bag"]
const products = await Promise.all(ids.map(id => tools.catalog.get_product({ id })))
return products.filter(p => p.stock < 5).map(({ id, stock }) => ({ id, stock }))
```

## Report partial failures

`Promise.all` rejects on the first failure and leaves the other results unread.

```js
const outcomes = await Promise.allSettled(ids.map(id => tools.catalog.get_product({ id })))
return {
  found: outcomes.filter(o => o.status === "fulfilled").map(o => o.value),
  failed: outcomes.flatMap((o, i) =>
    o.status === "rejected" ? [{ id: ids[i], error: o.reason.message }] : []),
}
```

## Two dependent stages, one program

```js
const open = await tools.issues.list({ state: "open" })
const details = await Promise.all(open.items.map(i => tools.issues.get({ id: i.id })))
return details.map(({ id, title, labels }) => ({ id, title, labels }))
```

## Batch only under a service limit

`limit` is the service's documented concurrency cap, not a constant.

```js
const out = []
for (let i = 0; i < ids.length; i += limit) {
  const batch = ids.slice(i, i + limit)
  out.push(...await Promise.all(batch.map(id => tools.catalog.get_product({ id }))))
}
return out
```

## Runtime facts

- The last expression is the result; `undefined` becomes `null`.
- Unawaited promises are interrupted when the program ends. Await what you need.
- No timers, packages, `eval`, `Proxy`, or private members. Otherwise strict-mode JS: classes, generators, `Map`/`Set`, `Promise.allSettled`.
- `console.log` lands in `logs`, not the result.
- `fetch` is a global, not a tool: not in the catalog, not counted as a tool call.
- Output past `maxOutputBytes` is truncated to a string. Return small shapes.
- Nested built-in and MCP tools still enforce their own permissions.

## Don't

- Don't script decision-dependent exploration. A script that catches every error hides the signal that should change the plan.
- Don't retry a whole script after a partial write failure; created records duplicate.
- Don't assume two calls on one record are atomic.
