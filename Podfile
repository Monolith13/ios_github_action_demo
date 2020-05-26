platform :ios, '13.0'

use_frameworks!

target "GithubActionDemo" do

  target 'UITests' do
    inherit! :search_paths
    pod 'Quick'
    pod 'Nimble'
  end
  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    puts target.name
  end
end