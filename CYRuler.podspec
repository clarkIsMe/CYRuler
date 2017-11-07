
pod::Spec.new do |s|
  s.name         = "CYRuler"    #存储库名称
  s.version      = "2.0"      #版本号，与tag值一致
  s.summary      = "a ruler"  #简介
  s.description  = "a ruler"  #描述
  s.homepage     = "https://github.com/clarkIsMe/CYRuler"      #项目主页，不是git地址
  s.license      = { :type => "MIT", :file => "LICENSE" }   #开源协议
  s.author             = { "zhangchao" => "943051580@qq.com" }  #作者
  s.platform     = :ios, "5.0"                  #支持的平台和版本号
  s.source       = { :git => "https://github.com/clarkIsMe/CYRuler.git", :tag => "2.0" }         #存储库的git地址，以及tag值
  s.source_files  =  "CYRuler/CYRuler/**/*.{h,m}" #需要托管的源代码路径
  s.requires_arc = true #是否支持ARC

end

