Pod::Spec.new do |s|
  s.name         = 'SmartVCard'
  s.version      = '<#Project Version#>'
  s.license      = '<#License#>'
  s.homepage     = '<#Homepage URL#>'
  s.authors      = '<#Author Name#>': '<#Author Email#>'
  s.summary      = '<#Summary (Up to 140 characters#>'

  s.platform     =  :ios, '<#iOS Platform#>'
  s.source       =  git: '<#Github Repo URL#>', :tag => s.version
  s.source_files = '<#Resources#>'
  s.frameworks   =  '<#Required Frameworks#>'
  s.requires_arc = true
  
# Pod Dependencies
  s.dependencies =	pod 'AFNetworking', '~> 2.0'
  s.dependencies =	pod 'MBProgressHUD', '~> 0.8'
  s.dependencies =	pod 'SDWebImage'
  s.dependencies =	pod 'SWTableViewCell', '~> 0.3.7'
  s.dependencies =	pod 'AMap2DMap', '~> 3.2.0'
  s.dependencies =	pod 'AMapSearch', '~> 3.1.0'
  s.dependencies =	pod 'FMDB'
  s.dependencies =	pod 'RSKImageCropper'
  s.dependencies =	pod 'PEPhotoCropEditor'
  s.dependencies =	pod 'ActionSheetPicker-3.0', '~> 1.5.1'
  s.dependencies =	pod 'HMSegmentedControl@hons82', '~> 1.3.1'

end