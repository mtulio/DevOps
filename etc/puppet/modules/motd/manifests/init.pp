class motd {

  file { "/etc/motd":
    ensure => 'file', # file exists resource. @check_doc
    #owner   => "root",
    #group   => "root",
    #mode    => "0644",
    #source => "puppet:///modules/motd/motd",    # path of file to be copied from master
    content => template('base/motd.erb'),
    }

}
