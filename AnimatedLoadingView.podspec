Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "AnimatedLoadingView"
s.summary = "Animated circle loading view, with changing colors."
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE.md" }

# 4
s.author = { "Ernesto Kim" => "" }

# 5
s.homepage = "https://github.com/ernu/Animated-Loading-View"

# 6
s.source = { :git => "https://github.com/ernu/Animated-Loading-View.git", :tag => "#{s.version}"}

# 7
s.framework = "UIKit"

# 8
s.source_files = "AnimatedLoadingView/**/*.{h,m}"

end