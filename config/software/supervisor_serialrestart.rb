name "supervisor-serialrestart"
default_version "0.1.1"

dependency "pip"

env = with_standard_compiler_flags(with_embedded_path)

build do
  command "#{install_dir}/embedded/bin/pip install -I --build #{project_dir} #{name}==#{version}", :env => env
end