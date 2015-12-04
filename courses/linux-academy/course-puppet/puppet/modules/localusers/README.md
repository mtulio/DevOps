# Module: Create local users with their groups

Testa as configurações:
```
# puppet parser validate manifests/init.pp
# puppet parser validate manifests/groups/whell.pp
# puppet parser validate manifests/groups/finance.pp

```

Apply config:
```
# puppet apply --noop tests/init.pp
# puppet apply --noop --debug tests/init.pp 
```


