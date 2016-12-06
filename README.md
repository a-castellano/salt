# salt


## Seting up the VM's

```
cd Vagrant
vagrant up
```

After creating the VM's we need to add saltminions keys

```
salt-key -A
salt '*' saltutil.sync_all
```

## Using Salt Mine

```
salt 'saltminion1' mine.get '*'  network.ip_addrs
saltminion1:
    ----------
    saltminion1:
        - 192.168.50.11
    saltminion2:
        - 192.168.50.12
```
