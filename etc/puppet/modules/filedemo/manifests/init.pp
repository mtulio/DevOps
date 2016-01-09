class filedemo {

  File {
    owner => 'root',
    group => 'finance',
    mode  => '0660',
  }

  $homedir = "/tmp"
  $content = "my files content"

  file { "${homedir}/myfile.txt" :
    content => $content,
  }

  file { "${homedir}/myfile2.txt" :
    content => "My file2 content",
  }

  file { "${homedir}/myfile3.txt" :
    content => "myfile3",
    owner   => admin,
    group   => root,
  }


}
