# Ekko Brick

A brick to create boilerplate for clean architecture using fewer libraries.

## How to use 🚀

```
mason make ekko_brick --project_name katekko --project_version 3.10.0
```

## Variables ✨

| Variable           | Description                     | Default | Type      | Conditional | When             |
| ------------------ | ------------------------------- | ------- | --------- | ----------- | ---------------- |
| `project_name`     | The name of the project         | example | `string`  | false       | N/A              |
| `project_version`  | The project version             | 3.10.0  | `string`  | false       | N/A              |

## How to initialize your project after brick 📦

- git init
- Install the [FVM](https://fvm.app/docs/getting_started/installation), it's a CLI for controll the flutter versions from your computer 
- Type `fvm use`
- Type `fvm flutter create .`
- Now just start the project:
- `fvm flutter run -d {windows/mac/chrome/android/ios}`

For further informations about the architecture itself you will need to wait for my tutorial in the future or call me on my discord ```Katekko```.
