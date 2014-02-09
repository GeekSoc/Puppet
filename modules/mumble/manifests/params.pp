# Class mumble::params
#
# This class contains every parameter which will be used in this puppet module
# for setting up a mumble voip server
class mumble::params {
  $package_name  = 'mumble-server'
  $password      = ''
  $port          = '64738'
  $bandwidth     = '72000'
  $motd          = false
}
