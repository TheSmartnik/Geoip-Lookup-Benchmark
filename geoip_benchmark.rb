require 'benchmark/ips'
require 'pry'
require 'maxminddb'
require 'geoip2_compat'
require 'hive_geoip2'
require 'maxmind_geoip2'

IP = "90.143.180.8"
DB = './country_db.mmdb'

def maxminddb
  db = MaxMindDB.new(DB)
  lookup = db.lookup(IP)
  lookup.country.name
end

# \/ shitty interface
def geoip2_compat
  db = GeoIP2Compat.new(DB)
  lookup = db.lookup(IP)
  lookup[:country_name]
end

def hive_geoip2
  lookup = Hive::GeoIP2.lookup(IP, DB)
  lookup['country']['names']['en']
end

def maxmind_geoip2
  MaxmindGeoIP2.file DB
  lookup = MaxmindGeoIP2.locate IP, 'en'
  lookup['country']
end

Benchmark.ips do |x|
  x.report('maxminddb')  { maxminddb }
  x.report('geoip2_compat')  { geoip2_compat }
  x.report('hive_geoip2')  { hive_geoip2 }
  x.report('maxmind_geoip2')  { maxmind_geoip2 }
  x.compare!
end
