source ./test/support/assertions.sh

source ./lib/_install.sh

# _install.sh dependancies
source ./lib/_utils.sh
source ./lib/_config.sh

function after  { rm -rf /tmp/.install.test /tmp/.install.global.test; }
function before {
  # setup stubbed fetched package
  mkdir -p /tmp/.install.test/test-pkg
  mkdir -p /tmp/.install.test/bin
  mkdir -p /tmp/.install.global.test/bin
  cd /tmp/.install.test
  echo -e "#!/usr/bin/env bash\necho test-pkg\n" > test-pkg/test.sh
  touch test-pkg/package.conf
}

function run_tests {
  # stub config
  config[package]="test-pkg"
  config[main]="test.sh"
  config[bin]="test"

  config[tmp]="bad_dir"
  refute "_install foo/bar" \
          "require existing tmp dir"

  assert_stderr "_install foo/bar" "_install: error without tmp dir"

  config[tmp]="/tmp/.install.test"
  config[local_bin]="/tmp/.install.test/bin"
  assert "_install foo/bar" "_install: proceed when tmp dir exists"

  refute_stderr "_install foo/bar" "_install: no error tmp dir exists"

  assert_file "/tmp/.install.test/.odbpm/test-pkg/test.sh" "_install: local install"
  assert_link "/tmp/.install.test/bin/test" "_install: create bin link"

  config[global]="/tmp/.install.global.test"
  config[method]="global"
  config[global_bin]="/tmp/.install.global.test/bin"

  assert "_install foo/bar" "_install: runs with global"
  assert_file "/tmp/.install.global.test/test-pkg/test.sh" "_install: global install"
  assert_link "/tmp/.install.global.test/bin/test" "_install: create bin link"
}
# vim: ft=sh:
