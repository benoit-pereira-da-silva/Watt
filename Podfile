workspace 'Watt'
xcodeproj 'PlayerSample/PlayerSample.xcodeproj'
xcodeproj 'WattAuthor/WattAuthor.xcodeproj'

target :PlayerSample do
    platform :ios, '6.0'
	pod 'AFNetworking','~>1.3.1'
	pod 'SSZipArchive','~> 0.2.2'
    pod 'TRVSMonitor',  { :git => 'https://github.com/benoit-pereira-da-silva/TRVSMonitor' }
    xcodeproj 'PlayerSample/PlayerSample.xcodeproj'
    link_with ['PlayerSample','PlayerSample Tests','PlayerSampleFlexions']
end

target :WattAuthor do
    platform :osx , '10.8'
	pod 'AFNetworking','~>1.3.1'
	pod 'SSZipArchive','~> 0.2.2'
    xcodeproj 'WattAuthor/WattAuthor.xcodeproj'
end


#pod 'Watt', {:git => 'https://github.com/benoit-pereira-da-silva/Watt.git'}
#pod 'WTM', {:git => 'https://github.com/benoit-pereira-da-silva/Watt.git'}

