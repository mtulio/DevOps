class motd {
    file { "/etc/motd":
        ensure => 'file', # file exists resource. @check_doc
        source => "puppet:///modules/motd/motd",    # path of file to be copied from master
    }
}
