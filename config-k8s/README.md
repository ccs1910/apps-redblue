# apps-redblue
K8s configuration for apps-redblue.

## Preparations
1. Connect to your EKS Cluster. 
References : https://aws.amazon.com/premiumsupport/knowledge-center/eks-cluster-connection/

2. Check your "kubectl" connectivity with your EKS Cluster
```
$ kubectl config current-context
```

3. Check If your EKS Cluster satisfies the pre-requisites
```
$ flux check --pre
```

## Flux CD Installation

1. This guideline is using Github. Therefore, we need to get the Github token to connect the FluxCD with the repository. 
Reference: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token
```
export GITHUB_TOKEN=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
```

2. Create fluxcd bootstrap for each environment. In this setup, we will have multiple EKS Cluster representing each SDLC environment.
```
$ flux bootstrap github \
  --owner=my-github-username \
  --repository=my-repository \
  --path=clusters/my-cluster 
```

**Example: **
```
$ flux bootstrap github \
  --owner=ccs1910 \
  --repository=apps-redblue \
  --path=config-k8s/clusters/dev 
```

3. Check if flux-system is installed. You will see namespace "flux-system" 
```
$ kubectl get ns
```

4. Wait until the configuration completed. the "READY" indicator should be "True"
```
$ watch flux get kustomization
```