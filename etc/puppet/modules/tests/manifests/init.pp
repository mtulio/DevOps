class tests {

#$foo = [ 'one', 'two', 'three' ]
#notice( $foo[1] )

#$foo = [ 'one', {'second' => 'two', 'third' => 'three'} ]
#notice( $foo[1]['third'] )

#$foo = [ 'one', 'two', 'three', 'four', 'five' ]
#notice( $foo[2] )
#notice( $foo[-2] )

#  $domains = [ "dom1", "dom2" ]
#  each($domains) |$domain| {
#    notice (" dominio: $domain ")
#  }

#$data = ["routers", "servers", "workstations"]
#$data.each |$item| {
# notify { $item:
#   message => $item
# }
#}

#$a.slice(2) |$entry|          { notice "first ${$entry[0]}, second ${$entry[1]}" }
#$a.slice(2) |$first, $second| { notice "first ${first}, second ${second}" }


#tests::drivemap { $drives:
#}

# Testing vectors
#['a','b','c'].each |Integer $index, String $value| { notice("${index} = ${value}") }

## Each
#$binaries = ["facter", "hiera", "mco", "puppet", "puppetserver"]

# function call with lambda:
#$binaries.each |String $binary| {
#  file {"/usr/bin/$binary":
#    ensure => link,
#    target => "/opt/puppetlabs/bin/$binary",
#  }
#}

## Slice
$a.slice(2) |$entry|          { notice "first ${$entry[0]}, second ${$entry[1]}" }
$a.slice(2) |$first, $second| { notice "first ${first}, second ${second}" }

#slice([1,2,3,4,5,6], 2) # produces [[1,2], [3,4], [5,6]]
#slice(Integer[1,6], 2)  # produces [[1,2], [3,4], [5,6]]
#slice(4,2)              # produces [[0,1], [2,3]]
#slice('hello',2)        # produces [[h, e], [l, l], [o]]



}
