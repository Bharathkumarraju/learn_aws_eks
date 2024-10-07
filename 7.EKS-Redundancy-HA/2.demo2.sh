IRSA - IAM Roles for Service Accounts(IRSA) -


Lets say we need to connect to AWS S3 from the pod inside a EKS cluster  -

first of all we need to have an external OIDC endpoint and this comes by default with an EKS cluster.

Webhook setup and Service Account Annotation:
------------------------------------------------------------->
Get this OIDC endpoint put in the IAM Credentials - Principal ARN in the trusted relationship section thats going to be call STS to assume role based on the
JWT token that OIDC endppoints gives.






