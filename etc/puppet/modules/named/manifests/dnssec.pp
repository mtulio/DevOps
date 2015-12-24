
#
# type : Type of next argument. Can be 'domain' or 'all'.
#  '-> all	: sign all domains
#  '-> domain	: sign one domain, var $domain
# domain: Domain to be signed if type was defined to 'domain'
#
class named::dnssec (
  $type,
  $domain,
) {

  file {'ScriptSignZone':
    path    => "${dirzone}/script_sign_zone.sh",
    source  => ["puppet:///modules/named/pool_default/zones/"],
    owner   => root,
    group   => root,
    mode    => 0755,
    require => File['SyncDirZones'],
  }

  if $type == 'all' {
    Exec['SignAllZones']
  }
  else {
    Exec["sig_$domain"]
  }

}
