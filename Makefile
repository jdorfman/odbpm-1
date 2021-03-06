shunt=./test/shunt.sh
shunt_opts= --verbose
shunt_cmd=$(shunt) $(shunt_opts)

odbpm:
	# merge lib/*.sh to odbpm
	cat ./lib/head.sh >> odbpm
	cat ./lib/_*.sh >> odbpm
	cat ./lib/exec.sh >> odbpm
	chmod 755 odbpm

unit: .PHONY
	make test/test_*.sh

test/%: test/shunt.sh odbpm .PHONY
	$(shunt_cmd) ./$@

clean:
	rm odbpm

test/clean:
	rm $(shunt)

test/shunt.sh:
	cd test && curl -L https://raw.github.com/odb/shunt/master/install.sh | bash -s local

install:
	cp -v ./odbpm /usr/local/bin/odbpm

uninstall:
	rm -v /usr/local/bin/odbpm

TESTS.md: .PHONY
	@echo "# Unit Test Output" > ./TESTS.md
	@echo '' >> TESTS.md
	@echo '```' >> TESTS.md
	@$(shunt_cmd) --plain ./test/test_args.sh    | tee -a ./TESTS.md
	@$(shunt_cmd) --plain ./test/test_config.sh  | tee -a ./TESTS.md
	@$(shunt_cmd) --plain ./test/test_deps.sh    | tee -a ./TESTS.md
	@$(shunt_cmd) --plain ./test/test_fetch.sh   | tee -a ./TESTS.md
	@$(shunt_cmd) --plain ./test/test_install.sh | tee -a ./TESTS.md
	@$(shunt_cmd) --plain ./test/test_utils.sh   | tee -a ./TESTS.md
	@echo '```' >> TESTS.md

.PHONY:

# vim: ft=make:
