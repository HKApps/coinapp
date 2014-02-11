require './config/boot'
require './config/environment'

Clockwork.every(5.second, "Update Price") { UpdatePriceWorker.perform_async }
