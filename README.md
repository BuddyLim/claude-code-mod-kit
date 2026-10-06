# mod-kit

The code the lens, parked and ledger mods share: the icon table and the
layout constants.

A mod's hooks module can only import files inside the mod's own folder, so the
kit is not a dependency. Each mod carries a copy under `hooks/kit/`, and
`sync.sh` writes those copies from `kit/`. A mod cloned by itself still works.

## Use

Edit a file under `kit/`, then:

```sh
./sync.sh                 # every mod under ~/.claude/skills that has a hooks/kit
./sync.sh <mod folder>…   # these mods; a first sync creates hooks/kit
```

Then run each mod's `claude plugin validate` and `claude plugin test`, and
commit the changed copies in each mod's repo.

## What is in it

- `kit/icons.ts`: the Nerd Font glyphs, the file-type table with its colours,
  and `iconOf(path)` / `refIcon("path:line")`.
- `kit/layout.ts`: `PAD` (the side padding), `cut` and `ageOf`.

Not in it yet: the pane keyboard handling and the text wrapping, which lens and
parked each still have their own version of.
