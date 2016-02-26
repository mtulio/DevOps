class filedemo ($content_file = $filedemo::params::content_file) inherits filedemo::params {

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


  # Testing class declaration and inheritance
  ## Test1 - calling class without send arguments
  #class { 'filedemo::newfile' : }

  ## Test2 - calling class sending new argument
  class { 'filedemo::newfile' : content_file => "New argument from init.pp - class declaration", }



}
