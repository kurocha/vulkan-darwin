#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

teapot_version "3.0"

define_project "vulkan-sdk-darwin" do |project|
	project.add_author "Samuel Williams"
	project.license = " Apache License, Version 2.0 / MIT License"

	project.version = "1.3.216"
end

define_target 'vulkan-sdk-darwin-library' do |target|
	target.provides 'Vulkan/SDK/Darwin/Library' do
		append header_search_paths(target.package.path + "source")		
		append linkflags(
			"-framework", "CoreFoundation",
			"-framework", "Foundation",
			"-framework", "IOSurface",
			"-framework", "Metal",
			"-framework", "Cocoa",
			"-framework", "QuartzCore",
			"-framework", "IOKit",
			target.package.path + "lib/macos-arm64_x86_64/libMoltenVK.a"
		)
	end

	target.provides :vulkan_library => 'Vulkan/SDK/Darwin/Library'
end

define_target 'vulkan-sdk-darwin-platform' do |target|
	target.depends 'Vulkan/SDK/Darwin/Library', public: true

	target.provides 'Vulkan/SDK/Darwin/Platform' do
		append buildflags "-DVK_USE_PLATFORM_MACOS_MVK"
	end
	
	target.provides :vulkan_platform => 'Vulkan/SDK/Darwin/Platform'
end
