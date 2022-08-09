# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def main_pods
  pod 'Alamofire', '~> 4.7'
  pod 'Kingfisher'
  pod 'EmptyStateKit'
end

def xctest_pods 
  pod 'Alamofire', '~> 4.7'
end

target 'IDN-Movie' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for IDN-Movie
  main_pods

  target 'IDN-MovieTests' do
    inherit! :search_paths
    # Pods for testing
    xctest_pods
  end

  target 'IDN-MovieUITests' do
    # Pods for testing
  end

end
