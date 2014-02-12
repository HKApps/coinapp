require './config/boot'
require './config/environment'

Clockwork.every(1.minute, "Update Price") { UpdatePriceWorker.perform_async }
