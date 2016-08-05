[![Build Status](http://ci.geppetto.no/api/badges/geppetto-apps/tmx.cr/status.svg)](http://ci.geppetto.no/geppetto-apps/tmx.cr)
[![Dependency Status](https://shards.rocks/badge/github/geppetto-apps/tmx.cr/status.svg)](https://shards.rocks/github/geppetto-apps/tmx.cr)
[![devDependency Status](https://shards.rocks/badge/github/geppetto-apps/tmx.cr/dev_status.svg)](https://shards.rocks/github/geppetto-apps/tmx.cr)

# Tmx.cr

Tmx loader for loading Tiled maps into a basic data structure in Crystal.

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  tmx:
    github: geppetto-apps/tmx.cr
```


## Usage


```crystal
require "tmx"

map = Tmx.load(some_path)
map.layers
```

## Development

TODO: Write development instructions here

## Updating docs

`bin/update-docs`

## Contributing

1. Fork it ( https://github.com/geppetto-apps]/tmx/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[theodorton]](https://github.com/theodorton) Theodor Tonum - creator, maintainer

## Acknowledgements

Fixtures and specs were fetched from the [tmx gem](https://github.com/shawn42/tmx) project.
