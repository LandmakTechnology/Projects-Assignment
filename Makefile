up: infra_up install deploy

down: infra_down

infra_up: init fmt
	@cd terraform && terraform apply --auto-approve

infra_down:
	@cd terraform && terraform destroy --auto-approve

init:
	@cd terraform && terraform init

fmt:	
	@cd terraform && terraform fmt

output:
	@chmod +x scripts/output.sh && ./scripts/output.sh

install: output
	@cd ansible && ansible-playbook -i inventory install.yaml

deploy: output
	@cd ansible && ansible-playbook -i inventory deploy.yaml

