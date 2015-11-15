# Geoip-Lookup-Benchmark
This repository sole purpose is to show difference in performance and interface,
between ruby gems for Geoip Lookup.

Benchmark test was done with [benchmark-ips](https://github.com/evanphx/benchmark-ips)

##Geoip Gems
> List of gems was taken from [maxmind site](http://dev.maxmind.com/geoip/geoip2/downloadable)

* [maxminddb](https://github.com/yhirose/maxminddb)
* [geoip2_compat](https://github.com/dbussink/geoip2_compat)
* [hive_geoip2](https://github.com/desuwa/hive_geoip2)
* [maxmind_geoip2](https://github.com/da4nik/geoip2)

## Test result
> IP version doesn't impact performance

> It was apparent, that maxminddb would be the slowest.
> Howwever, it has the best API, IMO.

```
Calculating -------------------------------------
           maxminddb   146.000  i/100ms
       geoip2_compat     1.158k i/100ms
         hive_geoip2   914.000  i/100ms
      maxmind_geoip2   997.000  i/100ms
-------------------------------------------------
           maxminddb    956.980  (± 4.0%) i/s -      4.818k
       geoip2_compat     12.215k (±12.4%) i/s -     60.216k
         hive_geoip2      9.264k (± 1.8%) i/s -     46.614k
      maxmind_geoip2     10.248k (± 3.5%) i/s -     51.844k

Comparison:
       geoip2_compat:    12215.1 i/s
      maxmind_geoip2:    10248.1 i/s - 1.19x slower
         hive_geoip2:     9263.6 i/s - 1.32x slower
           maxminddb:      957.0 i/s - 12.76x slower
```
