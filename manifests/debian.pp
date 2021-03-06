# manage debian specific things
class augeas::debian inherits augeas::base {

  package {
    ['augeas-lenses', 'libaugeas0', 'augeas-tools']:
      ensure => $augeas::version,
      before => File['/usr/share/augeas/lenses'],
  }

  $augeas_ruby = $::lsbdistcodename ? {
    'wheezy' => 'libaugeas-ruby1.9.1',
    default  => 'libaugeas-ruby1.8',
  }

  package {$augeas_ruby:
    ensure => $augeas::rubylib_version,
  }

}
