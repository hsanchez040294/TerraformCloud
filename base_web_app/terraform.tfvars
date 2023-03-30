network_cid_vpc = {
  DemoHector = "10.0.0.0/16"
  DevelopmentH = "10.0.0.0/16"
  UATH          = "10.1.0.0/16"
  ProductionH   = "10.2.0.0/16"
}

vpc_subnet_count = {
  DemoHector = 2
  DevelopmentH  = 2
  UATH           = 2
  ProductionH    = 3
}

instance_type = {
  DemoHector = "t2.micro"
  DevelopmentH  = "t2.micro"
  UATH           = "t2.small"
  ProductionH    = "t2.medium"
}

instaces_count  = {
  DemoHector = 2
  DevelopmentH  = 2
  UATH           = 4
  ProductionH    = 6
}

