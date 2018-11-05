# Thirft Workshop

This repo contains example code for creating thrift/clients and
servers using various tools. This repo contains example code for 
creating thrift/clients and servers using various tools. There is 
a simple thrift protocol designed for use with multiple clients. 
There is one RPC to increment a counter and another RPC to retrive 
the current value.`docker-compose` is used to create all the containers
for this exercise. The workshop is divided into two sections:

1. Using the official Thrift library to create the client and server.
	 Then booting the app with `docker-compose`.
2. Updating the code to use the third party tools to write the client
	 and server.

## Implementations

1. Master -- incrementer: ruby (thrifter), server: ruby
	 (thrift_server), reader: ruby (thrifter)

2. feature/ruby-cl-ruby-se -- timestamp: ruby (thrifter), server: ruby
	(thrift_server), reader: ruby (thrifter)

## Building

	make
	docker-compose up --build

## Adding More Examples

This reposistory can be used to experiement creating polygot
applications. It's also a great way to experiment using thrift in
different languages. Different implementations are kept in different
branches. So say you want to experiment with language X, checkout a
new branch named `feature/x`. Push your branch upstream once work is
complete. Next do a PR to master and update the "Implementations"
section in the README with a link to your branch.
