gen-rb/counting_service.rb: workshop.thrift
	docker run --rm -it -v $(CURDIR):/data -w /data thrift:0.9.3 \
		thrift --gen rb $<
