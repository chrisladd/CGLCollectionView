
Pod::Spec.new do |s|
  s.name             = "CGLCollectionView"
  s.version          = "0.1.0"
  s.summary          = "CGLCollectionView provides the foundation for building sophisticated layouts from scratch with UICollectionView."
  s.homepage         = "https://github.com/chrisladd/cglkit/CGLCollectionView"
  s.license          = '(c) 2015 by Chris Ladd, All Rights Reserved'
  s.author           = { "Chris Ladd" => "c.g.ladd@gmail.com" }
  s.source           = { :git => "git@github.com:chrisladd/cglkit.git", :tag => s.name + '-' + s.version.to_s }
  
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  sourceRoot = ''
  # sourceRoot = s.name + '/'
  s.source_files = sourceRoot + 'Pod/Classes/**/*'

end
