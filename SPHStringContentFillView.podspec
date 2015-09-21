Pod::Spec.new do |s|
  s.name             = "SPHStringContentFillView"
  s.version          = "0.1.0"
  s.summary          = "A view that fills itself with customizable string content."

  s.description      = <<-DESC
                       A view subclass that fills itself with multiple copies of a customizable string at randomly generated locations and rotations.
                       DESC

  s.homepage         = "https://github.com/sphippen/SPHStringContentFillView"
  s.license          = 'MIT'
  s.author           = { "Spencer Phippen" => "spencer.phippen@gmail.com" }
  s.source           = { :git => "https://github.com/sphippen/SPHStringContentFillView.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*.{h,mm}'
  s.public_header_files = 'Pod/Classes/**/*.h'
  s.resource_bundles = {
    'SPHStringContentFillView' => ['Pod/Assets/*.png']
  }

end
