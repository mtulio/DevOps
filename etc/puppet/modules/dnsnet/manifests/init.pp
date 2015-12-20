class dnsnet {

  # Include TheForeman DNS module [install it before]:
  include ::dns

  # Creating a DNS example1.gov
  dns::zone { 'example1.net': 
    soa         => $::fqdn,
    contact     => "admin.mtulio.eng.br",
  }

  # Add a DNS record
  #dns::record::ns { "@": zone => 'example1.net', data => "ns1.exmaple.net", }
  #dns::record::ns { "@": zone => 'example1.net', data => "ns2.example.net", }
  #dns::record::a { "ns1.example.net": zone => 'example1.net', data => "10.10.10.1", }
  #dns::record::a { "ns2.example.net": zone => 'example1.net', data => "10.10.10.2", }

}
