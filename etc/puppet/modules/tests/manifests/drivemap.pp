define tests::drivemap($parameters = '-w 20% -c 10% -p') {
    nrpebasic::command { "checkdisk ${name}":
       ensure     => 'present',
       command    => 'check_disk',
       parameters => "${parameters} ${name}",
    }

  notice (" #> drivemap call")
}
