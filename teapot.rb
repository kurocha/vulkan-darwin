#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

teapot_version "3.0"

define_project "vulkan-darwin" do |project|
	project.add_author "Samuel Williams"
	project.license = " Apache License, Version 2.0 / MIT License"

	project.version = "1.3.216"
end

define_target 'vulkan-darwin-library' do |target|
	target.provides 'Library/Vulkan/Darwin' do
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

	target.provides :vulkan_library => 'Library/Vulkan/Darwin'
end

define_target 'vulkan-darwin-platform' do |target|
	target.depends 'Library/Vulkan/Darwin', public: true

	target.provides 'Platform/Vulkan/Darwin' do
		append buildflags "-DVK_USE_PLATFORM_MACOS_MVK"
	end
	
	target.provides :vulkan_platform => 'Platform/Vulkan/Darwin'
end
