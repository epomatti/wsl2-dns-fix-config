# WSL2 DNS fix

Use this to make your WSL image run with Google `8.8.8.8` name resolver.

## Usage

Clone the repo, `cd` into it and run the configuration script:

ℹ️ This will delete `/etc/resolv.conf` and `/etc/wsl.conf` files

```bash
# Debian/Ubuntu
sudo sh ./run.sh
```

Restart WSL from your Windows terminal:

```ps1
wsl --shutdown
```

Your WSL image is now configured.

## What it does

[`run.sh`](./run.sh) script will perform the following tasks:

1. Delete (rm) `/etc/wsl.conf` and `/etc/resolv.conf` files
2. Create the new ".conf" files (available in the [dist](./dist/)) setting Google DNS for name resolution and preventing WSL from overriding it:
```sh
# /etc/wsl.conf
[network]
generateResolvConf = false

# /etc/resolv.conf
nameserver 8.8.8.8
```
3. Make `/etc/resolv.conf` immutable

## Sources

This gist was pretty useful and has more info if need be.

```
https://gist.github.com/coltenkrauter/608cfe02319ce60facd76373249b8ca6
```