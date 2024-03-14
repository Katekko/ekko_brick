# Ekko Brick

A brick to create boilerplate for clean architecture using fewer libraries.

## How to use 🚀

```
mason add ekko_brick -g
```

```
mason make ekko_brick --project_name katekko --project_version 3.19.3
```

## Variables ✨

| Variable           | Description                     | Default | Type      | Conditional | When             |
| ------------------ | ------------------------------- | ------- | --------- | ----------- | ---------------- |
| `project_name`     | The name of the project         | example | `string`  | false       | N/A              |
| `project_version`  | The project version             | 3.19.3  | `string`  | false       | N/A              |

## How to initialize your project after brick 📦

- git init
- Install the [FVM](https://fvm.app/docs/getting_started/installation), it's a CLI for controll the flutter versions from your computer 
- Type `fvm use`
- Type `fvm flutter create .`
- Now just start the project:
- `fvm flutter run -d {windows/mac/chrome/android/ios}`

If you need more help to use, see this video: [Youtube](https://www.youtube.com/watch?v=CeuuwlpNUs4&ab_channel=Katekko) (only in pt_BR)

## How to make changes in the brick and use locally 📦

- First create a temp folder inside the brick / `mkdir temp && cd temp`
- After, init the mason inside this temp folder / `mason init`
- Now add the locally brick that you wanna test the change / `mason add ekko_brick --path ../`
- Finally, just execute the brick / `mason make ekko_brick`

For further informations about the architecture itself you will need to wait for my tutorial in the future or call me on my discord ```Katekko```.
