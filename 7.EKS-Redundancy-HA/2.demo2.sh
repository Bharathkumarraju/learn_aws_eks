IRSA - IAM Roles for Service Accounts(IRSA) -


Lets say we need to connect to AWS S3 from the pod inside a EKS cluster  -

first of all we need to have an external OIDC endpoint and this comes by default with an EKS cluster.

Webhook setup and Service Account Annotation:
------------------------------------------------------------->
Get this OIDC endpoint put in the IAM Credentials - Principal ARN in the trusted relationship section thats going to be call STS to assume role based on the
JWT token that OIDC endppoints gives.

Mutating webhook in controlplane -


ServiceAccount -
IAM Role ARN:




bharathkumardasaraju@~$ kubectl get sa bharathapi-apps -n bharathapi-prod -o yaml
apiVersion: v1
automountServiceAccountToken: true
imagePullSecrets:
- name: dockerhub-registry-secret
kind: ServiceAccount
metadata:
  annotations:
    eks.amazonaws.com/role-arn: arn:aws:iam::123456789123:role/svc-irsa-bharathapi-app-prod-sin
    meta.helm.sh/release-name: bharathapi
    meta.helm.sh/release-namespace: bharathapi-prod
  creationTimestamp: "2024-03-07T09:49:35Z"
  labels:
    app.kubernetes.io/managed-by: Helm
  name: bharathapi-apps
  namespace: bharathapi-prod
  resourceVersion: "61157413"
  uid: 0d2d42b2-1cbe-4b82-9657-d310a4bebfac

bharathkumardasaraju@~$

bharathkumardasaraju@~$ aws-vault exec aws-prod -- aws iam get-role --role-name svc-irsa-bharathapi-app-prod-sin --query "Role.AssumeRolePolicyDocument" --output json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowRDSDBLogin",
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::123456789123:oidc-provider/oidc.eks.ap-southeast-1.amazonaws.com/id/294AC9ABCDEFGHIKJKLMNOP"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringLike": {
                    "oidc.eks.ap-southeast-1.amazonaws.com/id/294AC9ABCDEFGHIKJKLMNOP:aud": "sts.amazonaws.com",
                    "oidc.eks.ap-southeast-1.amazonaws.com/id/294AC9ABCDEFGHIKJKLMNOP:sub": "system:serviceaccount:bharathapi-prod:bharathapi-apps"
                }
            }
        }
    ]
}
bharathkumardasaraju@~$ aws-vault exec aws-prod -- aws iam list-attached-role-policies --role-name svc-irsa-bharathapi-app-prod-sin --query "AttachedPolicies[].PolicyArn"
[
    "arn:aws:iam::123456789123:policy/svc-irsa-bharathapi-app-policy-sin"
]
bharathkumardasaraju@~$ aws-vault exec aws-prod -- aws iam get-policy --policy-arn arn:aws:iam::123456789123:policy/svc-irsa-bharathapi-app-policy-sin
{
    "Policy": {
        "PolicyName": "svc-irsa-bharathapi-app-policy-sin",
        "PolicyId": "ANPARNKOEVN5YYTGDWTKB",
        "Arn": "arn:aws:iam::123456789123:policy/svc-irsa-bharathapi-app-policy-sin",
        "Path": "/",
        "DefaultVersionId": "v1",
        "AttachmentCount": 1,
        "PermissionsBoundaryUsageCount": 0,
        "IsAttachable": true,
        "Description": "Policy to enable IRSA authentication",
        "CreateDate": "2024-03-07T09:35:28+00:00",
        "UpdateDate": "2024-03-07T09:35:28+00:00",
        "Tags": [
            {
                "Key": "map-migrated",
                "Value": "mig46499"
            },
            {
                "Key": "env",
                "Value": "prod"
            },
            {
                "Key": "purpose",
                "Value": "Allow bharathapi-app application to use IRSA authentication"
            }
        ]
    }
}
bharathkumardasaraju@~$ aws-vault exec aws-prod -- aws iam get-policy-version --policy-arn arn:aws:iam::123456789123:policy/svc-irsa-bharathapi-app-policy-sin --version-id v1
{
    "PolicyVersion": {
        "Document": {
            "Statement": [
                {
                    "Action": [
                        "secretsmanager:ListSecretVersionIds",
                        "secretsmanager:GetSecretValue",
                        "secretsmanager:GetResourcePolicy",
                        "secretsmanager:DescribeSecret"
                    ],
                    "Effect": "Allow",
                    "Resource": "*",
                    "Sid": ""
                },
                {
                    "Action": "ssm:GetParameter",
                    "Effect": "Allow",
                    "Resource": "*",
                    "Sid": ""
                },
                {
                    "Action": "kms:Decrypt",
                    "Effect": "Allow",
                    "Resource": "*",
                    "Sid": ""
                },
                {
                    "Action": "secretsmanager:ListSecrets",
                    "Effect": "Allow",
                    "Resource": "*",
                    "Sid": ""
                },
                {
                    "Action": [
                        "logs:PutRetentionPolicy",
                        "logs:PutLogEvents",
                        "logs:DescribeLogStreams",
                        "logs:DescribeLogGroups",
                        "logs:CreateLogStream",
                        "logs:CreateLogGroup"
                    ],
                    "Effect": "Allow",
                    "Resource": "arn:aws:logs:*:*:*",
                    "Sid": "AllowCloudWatchAccess"
                },
                {
                    "Action": [
                        "rds:DescribeDBProxies",
                        "rds:DescribeDBProxyEndpoints",
                        "rds:DescribeDBProxyTargets",
                        "rds:ListTagsForResource",
                        "rds:DescribeDBInstances",
                        "rds:DescribeDBClusters"
                    ],
                    "Effect": "Allow",
                    "Resource": [
                        "arn:aws:rds:ap-southeast-1:123456789123:*:*"
                    ],
                    "Sid": "DescribeDBProxies"
                },
                {
                    "Action": "rds-db:connect",
                    "Effect": "Allow",
                    "Resource": [
                        "arn:aws:rds-db:ap-southeast-1:123456789123:dbuser:*/*"
                    ],
                    "Sid": "RDSConnect"
                },
                {
                    "Action": "secretsmanager:GetSecretValue",
                    "Effect": "Allow",
                    "Resource": [
                        "arn:aws:secretsmanager:ap-southeast-1:123456789123:secret:*"
                    ],
                    "Sid": "GetSecretValue"
                },
                {
                    "Action": "kms:Decrypt",
                    "Condition": {
                        "StringEquals": {
                            "kms:ViaService": "secretsmanager.ap-southeast-1.amazonaws.com"
                        }
                    },
                    "Effect": "Allow",
                    "Resource": "arn:aws:kms:ap-southeast-1:123456789123:key/e2846194-9f85-40f2-abff-9ef9675fc8e0",
                    "Sid": "AllowDecryptSecretValue"
                }
            ],
            "Version": "2012-10-17"
        },
        "VersionId": "v1",
        "IsDefaultVersion": true,
        "CreateDate": "2024-03-07T09:35:28+00:00"
    }
}
bharathkumardasaraju@~$







