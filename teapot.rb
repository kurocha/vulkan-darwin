#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

teapot_version "3.0"

define_target "vulkan-sdk-darwin" do |target|
	target.depends :platform
	target.depends "Build/Files"
	target.depends "Build/Make"
	
	target.provides "SDK/Vulkan" do
		append linkflags(target.package.path + "lib/osx/libMoltenVK.a")
		append header_search_paths(target.package.path + "source")
	end
end

define_configuration "moltenvk" do |configuration|
	configuration.public!
	
	configuration.require "build-make"
end