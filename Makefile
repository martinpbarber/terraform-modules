test:
	cd tests; go test -count 1 -v ./...

clean:
	-find . -type d -name .terraform -exec rm -rf {} \;
	find . -type f -name terraform.tfstate -exec rm -f {} \;
	find . -type f -name terraform.tfstate.backup -exec rm -f {} \;
