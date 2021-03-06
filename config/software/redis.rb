#
# Copyright:: Copyright (c) 2012-2014 Chef Software, Inc.
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

name "redis"
default_version "2.8.10"

version "2.8.19" do
  source :md5 => "3794107224043465603f48941f5c86a7"
end

version "2.8.17" do
  source :md5 => "69023c3005664602268a5e2dbe23425c"
end

version "2.8.16" do
  source :md5 => "edfab946e3bb4cefc3227a52399ce107"
end

version "2.8.14" do
  source :md5 => "5005c764bf8760ef661c8b198bb01780"
end

version "2.8.13" do
  source :md5 => "ea92053cbb6f4eb8a4347dbaac7d7dff"
end

version "2.8.12" do
  source :md5 => "27645ca17ac1c269e67862fcc0f1d2e3"
end

version "2.8.10" do
  source :md5 => "54a984a5c61fd1d815625fb1ea9ff5ad"
end

version "2.8.2" do
  source :md5 => "ee527b0c37e1e2cbceb497f5f6b8112b"
end

version "2.4.7" do
  source :md5 => "6afffb6120724183e40f1cac324ac71c"
end

source :url => "http://download.redis.io/releases/redis-#{version}.tar.gz"
relative_path "redis-#{version}"

make_args = ["PREFIX=#{install_dir}/embedded",
             "CFLAGS='-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include'",
             "LD_RUN_PATH=#{install_dir}/embedded/lib"].join(" ")

build do
  command ["make -j #{max_build_jobs}", make_args].join(" ")
  command ["make install", make_args].join(" ")
end
