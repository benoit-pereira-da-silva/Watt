Pod::Spec.new do |s|

  s.name        = 'Watt'
  s.version     = '1.37'
  s.authors     = { 'Benoit Pereira da Silva' => 'benoit@pereira-da-silva.com' }
  s.homepage    = 'https://github.com/benoit-pereira-da-silva/Watt'
  s.summary     = 'Watt is a data persistency framework'
  s.source      = { :git => 'https://github.com/benoit-pereira-da-silva/Watt.git'}
  s.license     = { :type => "LGPL", :file => "LICENSE" }

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.8'
  s.requires_arc = true
  s.source_files =  'Classes/Watt/**/*.{h,m}','Classes/Watt/*.{h,m}'
  s.public_header_files = 'Classes/Watt/**/*.h','Classes/Watt/*.h'

  #s.subspec 'Base' do |base|
  #  base.source_files =  'Classes/Watt/**/*.{h,m}','Watt/Base/*.{h,m}'
  #  base.public_header_files = 'Classes/Watt/**/*.h','Watt/Base/*.h'
  #end

  s.subspec 'WattPackager' do |packager|
    packager.description     = 'A module to extract, package transmit, download watt registry pool and bundles'
    packager.source_files =  'Classes/WattPackager/*.{h,m}'
    packager.public_header_files = 'Classes/WattPackager/*.h'
    packager.dependency 'SSZipArchive'
  end

  s.subspec 'WTM' do |m|
    m.description     = 'A multimedia - hypermedia engine built on Watt'
    m.source_files =  'Classes/WTM/**/*.{h,m}'
    m.public_header_files = 'Classes/WTM/**/*.h'
  #  WTM.dependency 'Watt/Base'
  end

  s.subspec 'WTMIOS' do |mios|
    mios.description   = 'Reusable WTM components for IOS'
    mios.ios.source_files =  'Classes/WTMIOS/**/*.{h,m}'
    mios.ios.public_header_files = 'Classes/WTMIOS/**/*.h'
    mios.resource_bundles = {'WTMIOS'=>'Classes/WTMIOS/Resources/*.png'}
  #  mios.dependency 'Classes/WTM'
    mios.ios.frameworks ='UIKit'
    mios.osx.source_files = ''
    mios.osx.public_header_files =''
  end

end
