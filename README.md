# WSL2 DNS Fix/Config

[![shell](https://img.shields.io/github/workflow/status/epomatti/wsl2-dns-fix-config/shell?style=flat)](https://github.com/epomatti/wsl2-dns-fix-config/actions/workflows/shell.yml)

One-liner shell script that will setup your WSL image to use custom nameserver `8.8.8.8` from Google.

## Usage

Clone it and run the shell:

```bash
sudo sh ./run.sh
```
Restart WSL:

```
wsl --shutdown
```
All done. Make sure you read [what it does](#what-it-does).

---

Prefer not to clone? You can get the source archive here:

```sh
curl -L 'https://github.com/epomatti/wsl2-dns-fix-config/archive/refs/tags/v1.0.0.tar.gz' \
  -o wsl2-dnsfix.tar.gz
  
tar -xf wsl2-dnsfix.tar.gz
```

**github.com** not resolving? You can try `curl --resolve` with one of GitHub's [IP addresses](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/about-githubs-ip-addresses):

```sh
curl --resolve 'codeload.github.com:443:20.201.28.149' \
  'https://codeload.github.com/epomatti/wsl2-dns-fix-config/tar.gz/refs/tags/v1.0.0' \
  -o wsl2-dnsfix.tar.gz
```

## What it does

The [`run.sh`](./run.sh) script will perform these tasks:

1. Delete the following files: `/etc/wsl.conf` and `/etc/resolv.conf`
2. Create the new ".conf" files (pre-created in the [dist](./dist/) folder) setting Google DNS for name resolution and preventing WSL from overriding it:

    ```sh
    # /etc/wsl.conf
    [network]
    generateResolvConf = false
    ```
    ```sh
    # /etc/resolv.conf
    nameserver 8.8.8.8
    ```
    
3. Make `/etc/resolv.conf` immutable

## Contributing

Feel free to open an issue/discussion or send a pull request.

Tested on:
- Ubuntu 20.04
- Ubuntu 22.04

## Source / Credits

```
https://gist.github.com/coltenkrauter/608cfe02319ce60facd76373249b8ca6
```
