Pod::Spec.new do |s|
  s.name = "IGViewQuery"
  s.version = "0.2.0"
  s.summary = "ViewQuery is a lightweight jQuery style view selector library for UIKit, based on Igor selector engine."
  s.homepage = "https://github.com/siuying/ViewQuery"
  s.author = { "Francis Chong" => "francis@ignition.hk"}

  s.source = { :git => "https://github.com/siuying/ViewQuery.git", :tag => "0.2.0" }
  s.platform = :ios, '6.0'
  s.source_files = 'IGViewQuery/Classes/*.{h,m}'
  s.requires_arc = true

  s.license = {:type => 'MIT', :file => 'LICENSE.txt' }
end
