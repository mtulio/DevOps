
# Test1: inherits from ntp::params 
#include ntp

# Test2: send args from class declaration on tests/init.pp
class { 'ntp' : package => 'ntp' , }

# Test3: send args from class declaration on manifests/site.pp
