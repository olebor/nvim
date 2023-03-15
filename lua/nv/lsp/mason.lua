local status_ok, module = pcall(require, "mason")
if not status_ok then
	return
end

module.setup(
	{
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗"
			}
		}
	}
)
