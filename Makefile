test:
	cd tests; go test -count 1 -v ./...

clean:
	-find ./examples -type d -name .terraform -exec rm -rf {} \;
	find ./examples -type f -name terraform.tfstate -exec rm -f {} \;
	find ./examples -type f -name terraform.tfstate.backup -exec rm -f {} \;
