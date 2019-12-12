#    Copyright 2018 Tech Bureau, Corp
# 
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
# 
#        http://www.apache.org/licenses/LICENSE-2.0
# 
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

require 'fileutils'
require 'yaml'
module Catapult
  BASE_DIR      = ::File.expand_path('../../', ::File.dirname(__FILE__))
  RUBY_BASE_DIR = ::File.expand_path('../', ::File.dirname(__FILE__))
 
  require_relative('catapult/global')
  # global must go first
  require_relative('catapult/addresses')
  require_relative('catapult/run_time_vars')
end
