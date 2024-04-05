# openfortivpn-as-proxy

[На русском](README.ru.md)

## Recipe

#### Clone repository

```shell
git clone https://github.com/labi-le/openfortivpn-as-proxy
```

#### Edit the `vpn` file in the `config` folder following the documentation [openfortivpn](https://github.com/adrienverge/openfortivpn)
```shell
man openfortivpn
```

#### Add domains to the `domain.rule` file

#### Start the containers
```shell
make up logs
```

### Usage examples:
[Google Chrome Proxy](https://www.chromium.org/developers/design-documents/network-settings)
```shell
google-chrome-stable --proxy-server=127.0.0.1:10443
```
[HTTP Proxy | PhpStorm](https://www.jetbrains.com/help/phpstorm/settings-http-proxy.html)

[Smart Proxy | Google Chrome Extension](https://chromewebstore.google.com/detail/smartproxy/jogcnplbkgkfdakgdenhlpcfhjioidoj)