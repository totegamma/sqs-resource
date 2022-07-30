# Concourse SQS Resource

A Concourse resource for AWS SQS.

## source config
- `region_name`: *Required.* your SQS's region
- `access_key`: *Required.* aws access key id
- `secret_key`: *Required.* aws secret access key
- `queue_url`: *Required.* your SQS's URL

## Example
```yaml
resource_types:
  - name: sqs-resource
    type: docker-image
    source:
      repository: ghcr.io/totegamma/sqs-resource
      tag: master

resources:
  - name: mysqs
    type: sqs-resource
    icon: aws
    source:
      region_name: 'YOUR_REGION'
      access_key: 'YOUR_AWS_ACCESS_KEY'
      secret_key: 'YOUR_AWS_SECRET_KEY'
      queue_url: 'YOUR_SQS_QUEUE_URL'

jobs:
  - name: printoutInput
    plan:
      - get: mysqs
        trigger: true
      - task: printoutInput
        config:
          platform: linux
          image_resource:
            type: registry-image
            source: {repository: busybox}
          inputs:
            - name: mysqs
          run:
            path: sh
            args:
              - -cex
              - |
                ls mysqs
                cat mysqs/Body
```

## Behaviour
### `check`:
try to receive 1 message with VisibilityTimeout=0

### `in`:
receive 1 message with VisibilityTimeout=60 and delete

### `out`:
post\_message.

