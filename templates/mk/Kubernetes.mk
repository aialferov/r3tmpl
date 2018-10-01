POD_NAME = $(shell kubectl get po \
				-l run=$(PROJECT) \
				-o jsonpath='{.items[*].metadata.name}')

KUBE_USAGE_PADDING = 13

kube-run:
	kubectl run $(PROJECT) -it --image=$(IMAGE) -- $(RUN_ARGS)

kube-join:
	kubectl exec \
		-it $(POD_NAME) -c $(PROJECT) -- \
		erl \
			-start_epmd false \
			-remsh $(PROJECT)@localhost \
			-sname $(PROJECT)-$$RANDOM \
			-setcookie $(PROJECT)

kube-shell:
	kubectl exec -it $(POD_NAME) -c $(PROJECT) sh

kube-attach:
	kubectl attach -it $(POD_NAME) -c $(PROJECT)

kube-upgrade:
	kubectl set image deployment/$(PROJECT) $(PROJECT)=$(IMAGE)

kube-delete:
	kubectl delete deployment $(PROJECT)

kube-logs:
	kubectl logs $(POD_NAME)

kube-logs-f:
	kubectl logs $(POD_NAME) -f

kube-help: kube-usage
kube-usage:
	@echo "Usage: make <Target> [Variables]"
	@echo
	@echo "Targets"
	$(usage-kube-targets)
	@echo
	@echo "Variables"
	$(usage-kube-variables)

define usage-kube-targets
	@printf \
		'$(shell printf "    %%-$(KUBE_USAGE_PADDING)s %%s\\\n%.0s" {1..8})'\
	kube-run "Create deployment \"$(PROJECT)\" using image \"$(IMAGE)\""  \
	kube-join "Remsh to Erlang application in running pod \"$(POD_NAME)\"" \
	kube-shell "Exec shell in running pod \"$(POD_NAME)\"" \
	kube-attach "Attach to running pod \"$(POD_NAME)\"" \
	kube-upgrade "Upgrade deployment \"$(PROJECT)\" to image \"$(IMAGE)\"" \
	kube-logs "Print running \"$(POD_NAME)\" pod logs" \
	kube-logs-f "Same as \"kube-logs\" but follow log output" \
	kube-delete "Delete deployment \"$(PROJECT)\""
endef

define usage-kube-variables
	@printf \
		'$(shell printf "    %%-$(KUBE_USAGE_PADDING)s %%s\\\n%.0s" {1..3})' \
	PROJECT "Deployment name (current: \"$(PROJECT)\")" \
	IMAGE "Image to deploy or upgrade deployment (current: \"$(IMAGE)\")" \
	RUN_ARGS "Container entrypoint arguments (current: \"$(RUN_ARGS)\")"
endef
