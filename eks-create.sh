apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig

metadata:
  name: eks-demo
  region: ap-southeast-1
  version: "1.22"

vpc:
  cidr: 10.65.0.0/16
  autoAllocateIPv6: false
  clusterEndpoints:
    publicAccess: true
    privateAccess: false
  nat:
    gateway: HighlyAvailable

managedNodeGroups:
  - name: ng-1
    labels: {role: workers}
    instanceType: m5.2xlarge
    desiredCapacity: 2
    minSize: 2
    maxSize: 9
    volumeSize: 64
    volumeType: gp2
    privateNetworking: true

cloudWatch:
    clusterLogging:
        # enable specific types of cluster control plane logs
        enableTypes: ["audit", "authenticator", "controllerManager"]
        # all supported types: "api", "audit", "authenticator", "controllerManager", "scheduler"
        # supported special values: "*" and "all"
