server "10.116.120.11", user: "deployer", roles: %w{app db web}

set :ssh_options, {
  forward_agent: true
}
