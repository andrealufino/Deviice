# Deviice

Swift Package (iOS 15+, zero dependencies) that identifies iOS devices at runtime. Maps hardware identifiers (e.g. `iPhone17,2`) to structured device info via a bundled JSON database.

## Architecture

Three files do everything:

| File | Purpose |
|------|---------|
| `Sources/Deviice/Device.swift` | Public `Device` struct. Codable. Loads JSON, exposes all properties. |
| `Sources/Deviice/Model.swift` | `Model` enum (String-backed). One case per device model. |
| `Sources/Deviice/devices.json` | 179-entry database keyed by hardware identifier. Source of truth. |

## Adding new devices (main maintenance task)

Three files must be updated in sync or tests will fail:

1. **devices.json** — Add one entry per hardware identifier. Multiple identifiers may share the same `specificModelRaw` (e.g. WiFi vs Cellular variants). See `docs/json-schema.md` for field reference.
2. **Model.swift** — Add a new `case` whose name matches `specificModelRaw` exactly. Place it in the correct MARK section, in generation order.
3. **Run tests** — `validateModels` catches any `specificModelRaw` value in JSON that doesn't match a `Model` case.

The JSON key is the hardware identifier (e.g. `"iPhone18,3"`). The `identifier` field inside the object must match that key.

## JSON-Swift sync rules

- Every `specificModelRaw` in devices.json must have a matching `Model` case.
- `Model` has one special case not backed by a JSON entry: `notMapped` (fallback for unknown identifiers).
- `cameraMegapixels` exists in every JSON entry but is NOT a property on `Device`. Synthesized `Codable` silently ignores extra keys.
- All 14 JSON fields must be present in every entry (no optional fields in the schema).

## Conventions

`specificModelRaw` naming — PascalCase, no spaces or hyphens:
- iPhones: `iPhone{generation}{variant}` — e.g. `iPhone16ProMax`, `iPhone16e`, `iPhoneAir1`
- iPads: `iPad{screenSize}Inch{generation}` / `iPadMini{gen}` / `iPadAir{size}Inch{gen}` / `iPadPro{size}Inch{gen}`
- iPods: `iPodTouch{generation}`
- Screen size in name: digits without decimal — `97` for 9.7", `109` for 10.9", `11` for 11", `129` for 12.9", `13` for 13"

Valid string field values:
- `biometricSupport`: `""`, `"Touch ID"`, `"Face ID"`
- `portType`: `"30-pin"`, `"Lightning"`, `"USB-C"`
- `displayType`: `"LCD"`, `"OLED"`, `"OLED ProMotion"`, `"OLED (Ultra Retina XDR)"`, `"Mini-LED"`
- `connectivity`: `"WiFi"`, `"WiFi+Cellular"`, `"2G"`, `"3G"`, `"4G"`, `"5G"`, `"simulator"`

JSON ordering: simulators first, then iPod, iPhone, iPad.

## Build and test

```bash
swift build
swift test
```

Tests use Swift Testing (not XCTest). Three tests:
- `validateJSON` — JSON loads and decodes successfully
- `validateModels` — every entry's `specificModelRaw` resolves to a `Model` case
- `validateNotMappedDevice` — an unknown identifier correctly produces a device with `.notMapped`

## Branch strategy

- `develop` — default branch, all development work goes here
- `master` — release-only, merged from develop when tagging
- Feature branches from develop: `feature/description`
- Release branches: `release/X.Y.Z`
- Tags: semantic versioning (current: `3.2.0`)

## Public API rules

Do NOT:
- Add required parameters to `Device.init(identifier:)`
- Remove or rename existing `Device` properties
- Change `Model` case raw values
- Add external dependencies

When adding new `Device` properties: add to the struct AND to all JSON entries simultaneously.

## Hardware identifier sources

Apple does not publish these. Reliable sources:
- https://www.theiphonewiki.com/wiki/Models
- https://everymac.com/systems/apple/
- ipsw.me

## Stale artifacts

- No CHANGELOG file exists.
