# Repository Guidelines

## Project Structure & Module Organization
- `unlink.typ` houses exported Typst helpers (`vantage`, `skill`, `findMe`); keep shared logic centralized here.
- `examples/` contains `example.typ`, `configuration.yaml`, and generated PDFs; add experimental layouts alongside the sample.
- `icons/` stores SVG assets referenced by filename; stick to lowercase, hyphenated names and consistent `viewBox` sizing.
- `README.md` is the user entry point—refresh CLI or setup instructions whenever behavior shifts.

## Build, Test, and Development Commands
- `typst compile examples/example.typ --root .` builds the reference resume to `examples/example.pdf`; run before every PR.
- `typst watch examples/example.typ --root . --open` enables live previews while iterating on layout or data.
- `typst compile examples/<variant>.typ --root .` verifies additional templates without moving assets or configuration files.

## Coding Style & Naming Conventions
- Indent nested Typst blocks by two spaces and align closing braces with their control statement.
- Use snake_case for variables and YAML keys, matching existing patterns; export macros with the established camelCase names.
- Prefer concise helpers over duplication, and add comments only for non-obvious layout tricks or Typst quirks.

## Testing Guidelines
- There is no automated suite; treat a clean `typst compile` with zero warnings as the acceptance check.
- Populate `examples/configuration.yaml` with realistic data when changing loops so reviewers see rendered edge cases.
- Commit a sample PDF or `.typ` file for new structures to make regression review straightforward.

## Commit & Pull Request Guidelines
- Follow Conventional Commits (`feat:`, `fix:`, `docs:`), mirroring the existing history (e.g., `feat: init from vantage-typst`).
- PRs should summarize intent, list touched files, and attach the regenerated output (PDF or screenshot) for visual confirmation.
- Call out new assets or configuration keys and link related issues or TODO follow-ups to keep context clear.

## Configuration & Asset Tips
- Keep personal details out of version control; use placeholders in tracked YAML files.
- Optimize SVGs by stripping metadata and reusing shared dimensions to prevent column drift.
- Document any new configuration fields directly in the sample YAML so template users adopt them correctly.
