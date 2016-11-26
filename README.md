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
