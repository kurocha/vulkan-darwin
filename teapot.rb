#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

teapot_version "3.0"

define_target "vulkan-library" do |target|
	target.depends "SDK/Vulkan", public: true
	
	target.provides "Library/vulkan" do
		append linkflags(target.package.path + "lib/osx/libMoltenVK.a")
		append header_search_paths(target.package.path + "source")
	end
end

define_target 'vulkan-platform-macos' do |target|
	target.provides 'Vulkan/Platform/macOS' do
		append buildflags "-DVK_USE_PLATFORM_MACOS_MVK"
		append linkflags %W{-framework Metal -framework IOSurface -framework Cocoa -framework QuartzCore -framework IOKit -framework CoreFoundation -framework Foundation}
	end
	
	target.provides :vulkan_platform => 'Vulkan/Platform/macOS'
end
