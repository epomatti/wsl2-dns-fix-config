# WSL2 DNS fix

One-liner shell script that setup your WSL image to use custom name resolution from Google.

This will help you prevent name resolution issues when coding and falling into those issues.

## Usage

Clone the repo, `cd` into it and run the configuration script:

```bash
# Debian/Ubuntu
sudo sh ./run.sh
```

The above command will delete `/etc/resolv.conf` and `/etc/wsl.conf` files, so don't need to worry on a fresh installation.

You can now restart WSL from your favorite Windows terminal, and it should work:

```ps1
wsl --shutdown
```

## What it does

The [`run.sh`](./run.sh) script will perform these tasks:

1. Delete the following files: `/etc/wsl.conf` and `/etc/resolv.conf`
2. Create the new ".conf" files (pre-created in the [dist](./dist/) folder) setting Google DNS for name resolution and preventing WSL from overriding it:

    ```sh
    # /etc/wsl.conf
    [network]
    generateResolvConf = false
    
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
