# Pure-FTP via using Vagrant

The pureftpd setup on a Vagrant VirtualBox VM.

## Installation

1. Install Virtualbox and Vagrant.

2. Clone or download this repo.

3. `cd` to the repo directory, do `vagrant up`. Wait for it to complete.

The default user credentials:

* Username: user1
* Password: q  

The default VM IP address is 192.168.33.31.

## Test your connection
From the host machine:
```bash
ftp -p 192.168.33.31 21
```
