# Contiv netplugin-init

This repository contains Contiv network plugin init container, it prepares
contiv netplugin/netmaster required configurations (e.g. CNI configs), to make
the netplugin/netmaster ready to run.

## Why need netplugin-init

Contiv netplugin and netmaster required several conditions been met before it
could be start correctly, it includes but not limits to below:

1. ensure required environment keys set
2. ensure required file directories created
3. ensure CNI configurations created
4. ensure openvswitch services are listening
5. data migrations

This container is aim to run before netplugin/netmaster container (e.g. k8s initContainer),
to ensure required conditions are met

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# Licence

Apache 2.0
