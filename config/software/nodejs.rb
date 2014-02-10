#
# Copyright:: Copyright (c) 2013 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "nodejs"
version "0.10.25"

source :url => "http://nodejs.org/dist/v#{version}/node-v#{version}.tar.gz",
       :md5 => "153bdbf77b4473df2600b8ce123ef331"

relative_path "node-v#{version}"

# Ensure we run with Python 2.6 on Redhats < 6
if OHAI['platform_family'] == "rhel" && OHAI['platform_version'].to_f < 6
  python = 'python26'
else
  python = 'python'
end

build do
  command "#{python} ./configure --prefix=#{install_dir}/embedded"
  command "make -j #{max_build_jobs}"
  command "make install"
end
