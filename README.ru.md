# openfortivpn-as-proxy

[In english](README.md)

## Рецепт

#### Склонировать репозиторий

```shell
git clone https://github.com/labi-le/openfortivpn-as-proxy
```

#### Отредактировать файл `vpn` в папке `config` следуя документации [openfortivpn](https://github.com/adrienverge/openfortivpn)

```shell
man openfortivpn
```

#### Добавить домены в файл `domain.rule`

#### Запустить контейнер

```shell
make up logs
```

### Примеры использования:

[Google Chrome Proxy](https://www.chromium.org/developers/design-documents/network-settings)

```shell
google-chrome-stable --proxy-server=127.0.0.1:10443
```

[HTTP Proxy | PhpStorm](https://www.jetbrains.com/help/phpstorm/settings-http-proxy.html)

[Smart Proxy | Google Chrome Extension](https://chromewebstore.google.com/detail/smartproxy/jogcnplbkgkfdakgdenhlpcfhjioidoj)