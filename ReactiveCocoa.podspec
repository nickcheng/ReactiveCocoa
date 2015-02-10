Pod::Spec.new do |s|
  s.name         = "ReactiveCocoa"
  s.version      = "2.4.6"
  s.summary      = "A framework for composing and transforming streams of values."
  s.homepage     = "https://github.com/blog/1107-reactivecocoa-is-now-open-source"
  s.author       = { "Josh Abernathy" => "josh@github.com" }
  s.source       = { :git => "https://github.com/ReactiveCocoa/ReactiveCocoa.git", :tag => "v2.4.6" }
  s.license      = 'MIT'
  s.description  = "ReactiveCocoa (RAC) is an Objective-C framework for Functional Reactive Programming. It provides APIs for composing and transforming streams of values."
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
  s.default_subspec = 'UI'

  s.subspec 'no-arc' do |sp|
    sp.source_files = 'ReactiveCocoa/RACObjCRuntime.{h,m}'
    sp.requires_arc = false
  end

  s.subspec 'Core' do |sp|
    sp.dependency 'ReactiveCocoa/no-arc'
    sp.source_files = 'ReactiveCocoa/**/*.{d,h,m,swift}'
    sp.private_header_files = '**/*Private.h', '**/*EXTRuntimeExtensions.h'
    sp.exclude_files = 'ReactiveCocoa/**/*{RACObjCRuntime,AppKit,NSControl,NSText,NSTable,UIActionSheet,UIAlertView,UIBarButtonItem,UIButton,UICollectionReusableView,UIControl,UIDatePicker,UIGestureRecognizer,UIRefreshControl,UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,UITableViewHeaderFooterView,UIText}*'
    sp.header_dir = 'ReactiveCocoa'
  end
  
    s.subspec 'UI' do |sp|
    sp.dependency 'ReactiveCocoa/Core'
    sp.source_files = 'ReactiveCocoa/**/*{AppKit,NSControl,NSText,NSTable,UIActionSheet,UIAlertView,UIBarButtonItem,UIButton,UICollectionReusableView,UIControl,UIDatePicker,UIGestureRecognizer,UIRefreshControl,UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,UITableViewHeaderFooterView,UIText}*'
    sp.ios.exclude_files = 'ReactiveCocoa/**/*{AppKit,NSControl,NSText,NSTable}*.{d,h,m}'
    sp.osx.exclude_files = 'ReactiveCocoa/**/*{UIActionSheet,UIAlertView,UIBarButtonItem,UIButton,UICollectionReusableView,UIControl,UIDatePicker,UIGestureRecognizer,UIRefreshControl,UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,UITableViewHeaderFooterView,UIText}*.{d,h,m}'
    sp.header_dir = 'ReactiveCocoa'
  end
end
