# Unit Test Output

```
(Running ./test/test_args.sh from: /home/jmervine/Development/odbpm)

1. [assert] _args_usage: exit zero passed
2. [assert_grep] _args_usage: display usage passed
3. [assert_grep] _args_validate: display usage when missing args passed
4. [refute_grep] _args_validate: display nothing when valid passed


Total: 4 Passed: 4 Failed: 0 Duration: 0 Seconds

(Running ./test/test_config.sh from: /home/jmervine/Development/odbpm)

1. [refute] _configure: fails without file argument passed
2. [refute] _configure: fails without file passed
3. [assert] _configure: passes with file passed
4. [assert_equal] _configure: config variable is set correctly passed
5. [assert_equal] _configure: config variable is set correctly passed
6. [assert_equal] _configure: config list is set correctly passed
7. [refute_equal] _configure: comments do not set config passed


Total: 7 Passed: 7 Failed: 0 Duration: 0 Seconds

(Running ./test/test_deps.sh from: /home/jmervine/Development/odbpm)

1. [refute] _deps_set: without deps passed
2. [assert] _deps_fetch: returns true passed
3. [assert] _deps_set: with deps passed


Total: 3 Passed: 3 Failed: 0 Duration: 0 Seconds

(Running ./test/test_fetch.sh from: /home/jmervine/Development/odbpm)

1. [assert] _fetch_mktmp: exists passed
2. [assert_dir] _fetch_mktmp: create temp dir passed
3. [assert_grep] _fetch_mktmp: set config[tmp] passed
4. [assert_file] _fetch_mktmp: fetch repo passed
5. [assert_file] _fetch_mktmp: extract repo passed
6. [refute_file] _fetch_cleanup: fetched repo passed
7. [refute_file] _fetch_cleanup: extracted repo passed
8. [assert_file] _fetch_repo: fetch repo with version passed
9. [assert_file] _fetch_repo: extract repo with version passed
10. [assert_grep] _fetch_repo: fetch correct version passed


Total: 10 Passed: 10 Failed: 0 Duration: 3 Seconds

(Running ./test/test_install.sh from: /home/jmervine/Development/odbpm)

1. [refute] require existing tmp dir passed
2. [assert_stderr] _install: error without tmp dir passed
3. [assert] _install: proceed when tmp dir exists passed
4. [refute_stderr] _install: no error tmp dir exists passed
5. [assert_file] _install: local install passed
6. [assert_link] _install: create bin link passed
7. [assert] _install: runs with global passed
8. [assert_file] _install: global install passed
9. [assert_link] _install: create bin link passed


Total: 9 Passed: 9 Failed: 0 Duration: 0 Seconds

(Running ./test/test_utils.sh from: /home/jmervine/Development/odbpm)

1. [assert] exists passed
2. [assert_stderr] _echoerr: return passed string passed
3. [assert] _make_local: exists passed
4. [assert_dir] _make_local: lib passed
5. [assert_dir] _make_local: link passed


Total: 5 Passed: 5 Failed: 0 Duration: 0 Seconds

```
