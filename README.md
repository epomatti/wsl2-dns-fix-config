# WSL2 DNS Fix/Config

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

Also available as a release (no git required):

```sh
curl -L https://github.com/epomatti/wsl2-dns-fix/archive/refs/tags/v1.0.0.tar.gz -o wsl2-dnsfix.tar.gz
tar -xf wsl2-dnsfix.tar.gz
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

## Source / Credits

```
https://gist.github.com/coltenkrauter/608cfe02319ce60facd76373249b8ca6
```
