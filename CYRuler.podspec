
Pod::Spec.new do |s|
s.name = 'CYRuler'
s.version = '2.0'
s.license = 'MIT'
s.summary = 'An custome scoller ruler.'
s.homepage = 'https://github.com/clarkIsMe/CYRuler'
s.authors = { '马春雨' => '943051580@qq.com' }
s.source = { :git => 'https://github.com/clarkIsMe/CYRuler.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'CYRuler/CYRuler/*.{h,m}'
end

