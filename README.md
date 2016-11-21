# salt


## Seting up the VM's

```
cd Vagrant
vagrant up
```

After creating the VM's we need to add saltminions keys

```
salt-key -a saltminion1
salt-key -a saltminion2
salt '*' saltutil.sync_all
```
